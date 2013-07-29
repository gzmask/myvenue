class DisplaysController < ApplicationController
  # GET /displays
  # GET /displays.xml
  require 'rss'
  #require 'feed_tools'

  def index
    @displays = Display.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @displays }
    end
  end

  # GET /displays/1
  # GET /displays/1.xml
  def show
    @display = Display.find(params[:id])
    #@rss = RSS::Parser.parse(open('http://www.facebook.com/feeds/page.php?format=atom10&id=216503310211').read, false)
    #@venue = Venue.find(@display.venue_id)    

    #if !@venue.twitter.nil? && !@venue.twitter.empty? 
    #   @feed = FeedTools::Feed.open(@venue.twitter)
    #end

	#create an new array and push all events into it for rss usage #by arthur
	@rss_results = Array.new                                       #by arthur
	@venue.schedules.each do |schedule|                            #by arthur
		@rss_results.push schedule                             #by arthur
		schedule.events.each do |event|                        #by arthur
			@rss_results.push event                        #by arthur
		end                                                    #by arthur
	end                                                            #by arthur
	respond_to do |format|					       #by arthur
		format.html { render :layout => false }                #by arthur
		format.xml  { render :xml => @rss_results }            #by arthur
	end 							       #by arthur 
##by arthur    respond_to do |format|
##by arthur      format.html { render :layout => false } # show.html.erb
##by arthur      format.xml  { render :xml => @display }
##by arthur    end
  end

  def content 
    @display = Display.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false } # show.html.erb
      format.xml  { render :xml => @display }
    end
 
  end

  # GET /displays/new
  # GET /displays/new.xml
  def new
    @display = Display.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @display }
    end
  end

  # GET /displays/1/edit
  def edit
    @display = Display.find(params[:id])
  end

  # POST /displays
  # POST /displays.xml
  def create
    @display = Display.new(params[:display])
    @display.venue_id = params[:venue_id]

    respond_to do |format|
      if @display.save
        flash[:notice] = 'Display was successfully created.'
        #format.html { redirect_to(@display) }
        format.html { redirect_to('/venues/'+params[:venue_id].to_s) }
        format.xml  { render :xml => @display, :status => :created, :location => @display }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @display.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /displays/1
  # PUT /displays/1.xml
  def update
    @display = Display.find(params[:id])

    respond_to do |format|
      if @display.update_attributes(params[:display])
        flash[:notice] = 'Display was successfully updated.'
        format.html { redirect_to('/venues/'+@display.venue_id.to_s) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @display.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /displays/1
  # DELETE /displays/1.xml
  def destroy
    @display = Display.find(params[:id])
    @display.destroy

    respond_to do |format|
      format.html { redirect_to(displays_url) }
      format.xml  { head :ok }
    end
  end


  #GET /displays/1/banner  (outputs xml)
  def banner
    @display = Display.find(params[:id])
    render :layout => false, :content_type => 'application/xml' 
  end

  #GET /displays/1/frame  (outputs html)
  def frame
    @display = Display.find(params[:id])
    render :layout => false
  end

end
