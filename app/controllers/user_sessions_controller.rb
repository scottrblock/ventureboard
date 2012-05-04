class UserSessionsController < ApplicationController

  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
	render :layout => !request.xhr?
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
	  flash[:notice] = "Login successful!"
      redirect_to root_url
    else
	  if request.xhr?
        render :text => 'Invalid login/password combination', :status => 406
      else
        render :new 
	  end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Come back soon!"
    redirect_to root_url
  end

end

