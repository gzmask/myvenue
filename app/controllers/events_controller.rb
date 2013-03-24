class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.all
    if params[:schedule_id] != nil
      display_events = Schedule.find(params[:schedule_id]).events.all(:order => "start_time ASC").dup
      json_events = Array.new
      
      # check daylight saving hours
      chour = Time.now.hour
      @syshour = chour
      #if Time.local(Date.today.year, Date.today.month, Date.today.day).isdst
      #   chour = chour -1
      #end
      
      #handling effective date and time alos recurrence
      display_events.each do |event|
        event.destroy if Date.today > event.defective_date
        next if event.effective_date > Date.today || event.defective_date < Date.today
	next if (event.end_time.hour * 60 + event.end_time.min) < (chour * 60 + Time.now.min)
        if event.recurrence == 2 
          /,?#{Date.today.wday.to_s},?/ =~ event.weekly 
          next unless $& != nil
        elsif event.recurrence == 3
        #  /,?#{Date.today.mday.to_s},?/ =~ event.monthly 
	   /\A(([\d,]+),#{Date.today.mday.to_s},([\d,]+)|([\d,]+),#{Date.today.mday.to_s}|#{Date.today.mday.to_s},([\d,]+)|#{Date.today.mday.to_s})\Z/ =~ event.monthly 
          next unless $& != nil
        end
        json_events.push(event)
      end

      #handling row limit and sort by time 
      json_events = json_events.sort_by {|event| event.start_time.hour*60+event.start_time.min } 
      json_events = json_events[0..(Schedule.find(params[:schedule_id]).row_limit-1)] 
      #@debug = String.new
      #json_events.each do |event|
      #  @debug += '<br />'+event.name+' Time now:' + Time.now.hour.to_s + ' event start time:' + event.start_time.to_s
      #end
      #sorting
      #@events = @events.all(:order => "start_time ASC", :limit => Schedule.find(params[:schedule_id]).row_limit)
      #display_events = display_events.all(:order => "start_time ASC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.json  { render :json => json_events if params[:schedule_id] != nil }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    #@event.start_time = @event.start_time - Schedule.find(params[:schedule_id]).venue.time_zone.hours
    #@event.end_time = @event.end_time - Schedule.find(params[:schedule_id]).venue.time_zone.hours
    @event.schedule_id = params[:schedule_id]

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])
    params[:event][:schedule_id] = @event.schedule_id
    #@event.start_time = @event.start_time - @event.schedule.venue.time_zone.hours
    #@event.end_time = @event.end_time - @event.schedule.venue.time_zone.hours

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    schedule_id = @event.schedule.id
    @event.destroy

    respond_to do |format|
      format.html { redirect_to('/schedules/'+schedule_id.to_s+'/edit') }
      format.xml  { head :ok }
    end
  end
end
