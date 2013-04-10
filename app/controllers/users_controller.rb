class UsersController < ApplicationController
  def new
    @user = User.new
    3.times { @user.emails.build }
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to new_session_url
    else
      render :new
    end
  end
end
