class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.xml

  protect_from_forgery :only => [:create, :update, :destroy] 
  def index
    if session[:user_id] == nil
      #do nothing
    elsif User.find(session[:user_id]).is_developer
      @venues = Venue.all
    elsif User.find(session[:user_id]).is_admin
      @venues = Venue.all
    else
      @venues = User.find(session[:user_id]).venues
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.xml
  def show
    if session[:user_id] == nil
        redirect_to "/login"
    else
      @venue = Venue.find(params[:id])
      @splash_ads = @venue.splash_ads.all
      @advertisements = @venue.advertisements.all
      @schedules = @venue.schedules.all
      @display = @venue.display if @venue.display != nil

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @venue }
      end
    end
  end

  # GET /venues/new
  # GET /venues/new.xml
  def new
    if session[:user_id] == nil
        redirect_to "/login"
    else
	 
	    @venue = Venue.new if User.find(session[:user_id]).is_admin
	    @venue.display = Display.new
	    @venue.time_box = TimeBox.new
	    @venue.weather_box = WeatherBox.new
	    @users = User.all

	    respond_to do |format|
	      format.html # new.html.erb
	      format.xml  { render :xml => @venue }
	    end
    end
  end

  # GET /venues/1/edit
  def edit
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
      @venue = Venue.find(params[:id]) if User.find(session[:user_id]).is_admin
      @users = User.all
    end
  end

  # POST /venues
  # POST /venues.xml
  def create
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @venue = Venue.new(params[:venue]) if User.find(session[:user_id]).is_admin
	    background_image = params[:venue][:background_image]
	    @venue.background_image = background_image.original_filename if background_image != nil
	    #@venue.user_id = session[:user_id]

	    respond_to do |format|
	      if @venue.save
		background_image_path = Rails.root.join('public', 'venues', @venue.id.to_s)
		Dir.mkdir(background_image_path) unless File.directory? background_image_path
		if background_image != nil
		  File.open(Rails.root.join('public', 'venues', @venue.id.to_s, background_image.original_filename), 'wb') do |file|
		    file.write(background_image.read)
		  end
		end
		flash[:notice] = 'Venue was successfully created.'
		format.html { redirect_to(@venue) }
		format.xml  { render :xml => @venue, :status => :created, :location => @venue }
	      else
		format.html { render :action => "new" }
		format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
	      end
	    end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.xml
  def update
    if session[:user_id] == nil
        redirect_to "/login"
    else
	 
	    @venue = Venue.find(params[:id]) if User.find(session[:user_id]).is_admin
	    background_image = params[:venue][:background_image]
	    background_image_path = Rails.root.join('public', 'venues', @venue.id.to_s)
	    Dir.mkdir(background_image_path) unless File.directory? background_image_path
	    if background_image != nil
	      File.delete(File.join(background_image_path, @venue.background_image)) if File.exist?(File.join(background_image_path, @venue.background_image))
	      File.open(Rails.root.join('public', 'venues', @venue.id.to_s, background_image.original_filename), 'wb') do |file|
		file.write(background_image.read)
		params[:venue][:background_image] = background_image.original_filename
	      end
	    end

	    respond_to do |format|
	      if @venue.update_attributes(params[:venue])
		flash[:notice] = 'Venue was successfully updated.' 
		format.html { redirect_to(@venue) }
		format.xml  { head :ok }
	      else
		format.html { render :action => "edit" }
		format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
	      end
	    end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.xml
  def destroy
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @venue = Venue.find(params[:id]) if User.find(session[:user_id]).is_admin
	    background_image_path = Rails.root.join('public', 'venues', @venue.id.to_s)
	    if @venue.advertisements.empty? && @venue.splash_ads.empty? && @venue.schedules.empty?
	      #File.delete(File.join(background_image_path, @venue.background_image)) if File.exist?(File.join(background_image_path, @venue.background_image))
	      #Dir.rmdir(background_image_path)
	      @venue.del_file
	      @venue.display.destroy
	      @venue.destroy
	      flash[:notice] = 'Removed:' + background_image_path
	    else
	      flash[:notice] = 'Warning: please clear the content of this venue first.'
	    end

	    respond_to do |format|
	      format.html { redirect_to(venues_url) }
	      format.xml  { head :ok }
	    end

     end
  end
end
