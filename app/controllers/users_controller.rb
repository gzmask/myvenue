class UsersController < ApplicationController
  # GET /users
  # GET /users.xml

  protect_from_forgery :only => [:create, :update, :destroy] 

  def index
    if User.find(session[:user_id]).is_admin 
      @users = User.all 
    elsif User.find(session[:user_id]).is_client 
      @users = [User.find(session[:user_id])] 
    elsif User.find(session[:user_id]).is_developer 
      @users = [User.find(session[:user_id])]
    else
      @users = nil
    end

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @user = User.find(params[:id]) if session[:user_id] != nil

	    respond_to do |format|
	      format.html # show.html.erb
	      #format.xml  { render :xml => @user }
	    end
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if session[:user_id] == nil
        redirect_to "/login"
    else
	 
	    if User.find(session[:user_id]).is_admin 
	      @user = User.new if session[:user_id] != nil
	    end

	    respond_to do |format|
	      format.html # new.html.erb
	      #format.xml  { render :xml => @user }
	    end
    end
  end

  # GET /users/1/edit
  def edit
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
      @user = User.find(params[:id]) if User.find(session[:user_id]).is_admin 
    end
  end

  # POST /users
  # POST /users.xml
  def create
    if session[:user_id] == nil
        redirect_to "/login"
    else
 
	    @user = User.new(params[:user]) if User.find(session[:user_id]).is_admin 

	    respond_to do |format|
	      if User.exists?(:name => @user.name)
		flash[:notice] = 'User existed, please choose a different name.'
		format.html { render :action => "new" }
	      elsif @user.save
		flash[:notice] = 'User was successfully created.'
		format.html { redirect_to(@user) }
	      else
		format.html { render :action => "new" }
	      end
	    end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
     if session[:user_id] == nil
        redirect_to "/login"
    else

	    @user = User.find(params[:id]) if User.find(session[:user_id]).is_admin

	    respond_to do |format|
	      if @user.update_attributes(params[:user])
		flash[:notice] = 'User was successfully updated.'
		format.html { redirect_to(@user) }
		#format.xml  { head :ok }
	      else
		format.html { render :action => "edit" }
		#format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
	      end
	    end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    if session[:user_id] == nil
        redirect_to "/login"
    else
	 
	    @user = User.find(params[:id])
	    @user.destroy if User.find(session[:user_id]).is_admin

	    respond_to do |format|
	      format.html { redirect_to(users_url) }
	      #format.xml  { head :ok }
	    end
    end
  end
end
