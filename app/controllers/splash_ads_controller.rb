class SplashAdsController < ApplicationController
  # GET /splash_ads
  # GET /splash_ads.xml

  protect_from_forgery :only => [:create, :update, :destroy] 
  def index
    @splash_ads = SplashAd.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @splash_ads }
    end
  end

  # GET /splash_ads/1
  # GET /splash_ads/1.xml
  def show
    @splash_ad = SplashAd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @splash_ad }
    end
  end

  # GET /splash_ads/new
  # GET /splash_ads/new.xml
  def new
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @splash_ad = SplashAd.new if User.find(session[:user_id]) #if User.find(session[:user_id]).is_admin

	    respond_to do |format|
	      format.html # new.html.erb
	      format.xml  { render :xml => @splash_ad }
	    end
    end
  end

  # GET /splash_ads/1/edit
  def edit
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
      @splash_ad = SplashAd.find(params[:id]) if User.find(session[:user_id]) #if User.find(session[:user_id]).is_admin

    end
  end

  # POST /splash_ads
  # POST /splash_ads.xml
  def create
    @splash_ad = SplashAd.new(params[:splash_ad])
    image_file = @splash_ad.image_file
    @splash_ad.image_file = image_file.original_filename if image_file != nil
    @splash_ad.venue_id = params[:venue_id]

    respond_to do |format|
      if @splash_ad.save
	splash_id = @splash_ad.id
        image_file_path= Rails.root.join('public', 'splash_ads', splash_id.to_s)
	Dir.mkdir(image_file_path) unless File.directory? image_file_path
	if image_file != nil
	  File.open(Rails.root.join('public', 'splash_ads', splash_id.to_s, image_file.original_filename), 'wb') do |file|
	    file.write(image_file.read)
	  end
	end
        flash[:notice] = 'SplashAd was successfully created.'
        format.html { redirect_to(@splash_ad) }
        format.xml  { render :xml => @splash_ad, :status => :created, :location => @splash_ad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @splash_ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /splash_ads/1
  # PUT /splash_ads/1.xml
  def update
    @splash_ad = SplashAd.find(params[:id])

    respond_to do |format|
      if @splash_ad.update_attributes(params[:splash_ad])
        flash[:notice] = 'SplashAd was successfully updated.'
        format.html { redirect_to(@splash_ad) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @splash_ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /splash_ads/1
  # DELETE /splash_ads/1.xml
  def destroy
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @splash_ad = SplashAd.find(params[:id]) if User.find(session[:user_id]) #if User.find(session[:user_id]).is_admin
	    venue_id = @splash_ad.venue_id
	    #image_file_path = Rails.root.join('public', 'splash_ads', @splash_ad.id.to_s)
	    #File.delete(File.join(image_file_path, @splash_ad.image_file)) if File.exist?(File.join(image_file_path, @splash_ad.image_file))
	    #Dir.rmdir(image_file_path)
	    @splash_ad.del_file
	    @splash_ad.destroy

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
