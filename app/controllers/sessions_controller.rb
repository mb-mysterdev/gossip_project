class SessionsController < ApplicationController
  def new
    render :layout => false     
  end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:first_name] = user.first_name
      redirect_to gossips_path
    else
      redirect_to root_path
    end
  end
  def destroy
    session.delete(:user_id)
    session.delete(:first_name)
    redirect_to root_path
  end

end
