class AuthenticationsController < ApplicationController

  def index
     @authentications = Authentication.all

     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @authentications }
     end
  end

  def create
    # this is where you get all the data from your provider through omniauth
    omniauth = request.env['omniauth.auth'] 
    @auth = Authentication.find_from_hash(omniauth)
    if current_user
      #Add an auth to existing user
      current_user.authentications.create(:provider => omniauth['provider'], 
					 :uid => omniauth['uid'])     
      flash[:notice] = "Successfully added #{omniauth['provider']} authentication"
    elsif @auth
      #User is present. Login the user with his social account
      UserSession.create(@auth.user, true) 
      flash[:notice] = "Welcome back #{omniauth['provider']} user"
    else 
      #Create a new user
      @new_auth = Authentication.create_from_hash(omniauth, current_user)     
      #Log the authenticated user in.
      UserSession.create(@new_auth.user, true)   
      flash[:notice] = "Welcome #{omniauth['provider']} user. Your account has been created."
    end
    redirect_to root_url
  end
  
  def failure
    flash[:notice] = "Sorry, You did not authorize."
    redirect_to root_url
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully deleted #{@authentication.provider} authentication."
    redirect_to root_url
  end
  
end
