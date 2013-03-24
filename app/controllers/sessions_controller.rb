class SessionsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    current_user = User.find_by_name(params[:user][:name])
    if current_user && current_user.password == params[:user][:password]
      session[:user_id] = current_user.id
      redirect_to root_url
    else
      flash[:notice] = "Password and User name doesn't match."
      render :action => "new"
    end
  end

  def edit
  end

  def destroy
      session[:user_id] = nil
      reset_session
      flash[:notice] = "you have logged out!"
      redirect_to root_url
  end

end
