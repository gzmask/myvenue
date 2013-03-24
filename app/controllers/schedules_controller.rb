class SchedulesController < ApplicationController
  # GET /schedules
  # GET /schedules.xml
  protect_from_forgery :only => [:create, :update, :destroy] 

  def index
    @schedules = Schedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schedules }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.xml
  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.xml
  def new
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @schedule = Schedule.new if User.find(session[:user_id]).is_admin

	    respond_to do |format|
	      format.html # new.html.erb
	      format.xml  { render :xml => @schedule }
	    end
    end
  end

  # GET /schedules/1/edit
  def edit
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
      @schedule = Schedule.find(params[:id]) if User.find(session[:user_id]).is_admin || User.find(session[:user_id]).is_client 

    end
  end

  # POST /schedules
  # POST /schedules.xml
  def create
    @schedule = Schedule.new(params[:schedule])
    @schedule.venue_id = params[:venue_id]

    respond_to do |format|
      if @schedule.save
        flash[:notice] = 'Schedule was successfully created.'
        format.html { redirect_to(@schedule) }
        format.xml  { render :xml => @schedule, :status => :created, :location => @schedule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.xml
  def update
    if session[:user_id] == nil
        redirect_to "/login"
    else
	 
	    @schedule = Schedule.find(params[:id]) if User.find(session[:user_id]).is_admin 

	    respond_to do |format|
	      if @schedule.update_attributes(params[:schedule])
		flash[:notice] = 'Schedule was successfully updated.'
		format.html { redirect_to(@schedule) }
		format.xml  { head :ok }
	      else
		format.html { render :action => "edit" }
		format.xml  { render :xml => @schedule.errors, :status => :unprocessable_entity }
	      end
	    end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.xml
  def destroy
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @schedule = Schedule.find(params[:id]) if User.find(session[:user_id]).is_admin
	    venue_id = @schedule.venue_id
	    @schedule.events.each do |event|
	      event.destroy
	    end
	    @schedule.destroy

	    respond_to do |format|
	      if Venue.exists?(venue_id)
		format.html { redirect_to('/venues/'+venue_id.to_s) }
	      else
		format.html { redirect_to('/venues/') }
	      end
	      format.xml  { head :ok }
	    end
    end
  end
end
