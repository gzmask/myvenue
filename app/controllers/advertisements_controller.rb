class AdvertisementsController < ApplicationController
  # GET /advertisements
  # GET /advertisements.xml
  protect_from_forgery :only => [:create, :update, :destroy] 

  def index
    @advertisements = Advertisement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @advertisements }
    end
  end

  # GET /advertisements/1
  # GET /advertisements/1.xml
  def show
    @advertisement = Advertisement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @advertisement }
    end
  end

  # GET /advertisements/new
  # GET /advertisements/new.xml
  def new
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @advertisement = Advertisement.new if User.find(session[:user_id]) #if User.find(session[:user_id]).is_admin

	    respond_to do |format|
	      format.html # new.html.erb
	      format.xml  { render :xml => @advertisement }
	    end
   end
  end

  # GET /advertisements/1/edit
  def edit
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
      @advertisement = Advertisement.find(params[:id]) if User.find(session[:user_id]) #if User.find(session[:user_id]).is_admin
    end
  end

  # POST /advertisements
  # POST /advertisements.xml
  def create
    @advertisement = Advertisement.new(params[:advertisement])
    #flash_file = @advertisement.flash_file
    #@advertisement.flash_file = flash_file.original_filename if flash_file != nil
    @advertisement.venue_id = params[:venue_id]

    respond_to do |format|
      if @advertisement.save
	advertisement_id = @advertisement.id
        #flash_file_path= Rails.root.join('public', 'advertisements', advertisement_id.to_s)
	#Dir.mkdir(flash_file_path) unless File.directory? flash_file_path
	#if flash_file != nil
	#  File.open(Rails.root.join('public', 'advertisements', advertisement_id.to_s, flash_file.original_filename), 'wb') do |file|
	#    file.write(flash_file.read)
	#  end
	#end
        flash[:notice] = 'Advertisement was successfully created.'
        format.html { redirect_to(@advertisement) }
        format.xml  { render :xml => @advertisement, :status => :created, :location => @advertisement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @advertisement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /advertisements/1
  # PUT /advertisements/1.xml
  def update
    @advertisement = Advertisement.find(params[:id])

    respond_to do |format|
      if @advertisement.update_attributes(params[:advertisement])
        flash[:notice] = 'Advertisement was successfully updated.'
        format.html { redirect_to(@advertisement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @advertisement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1
  # DELETE /advertisements/1.xml
  def destroy
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @advertisement = Advertisement.find(params[:id]) if User.find(session[:user_id]) #if User.find(session[:user_id]).is_admin
	    venue_id = @advertisement.venue_id
	    #flash_file_path = Rails.root.join('public', 'advertisements', @advertisement.id.to_s)
	    #File.delete(File.join(flash_file_path, @advertisement.flash_file)) if File.exist?(File.join(flash_file_path, @advertisement.flash_file))
	    #Dir.rmdir(flash_file_path)
	    #@advertisement.del_file
	    @advertisement.destroy

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
