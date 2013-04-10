class SessionsController < ApplicationController

  def new
  end

  def create
    email = Email.find_by_email(params[:email])
    if email && ( email.user.password == params[:password] )
      cookies.permanent[:current_user] = email.user.id
      redirect_to new_session_url
    else
      render :new
    end
  end

  def destroy
    cookies.delete(:current_user)
    redirect_to new_session_url
  end

end
