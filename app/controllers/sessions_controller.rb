class SessionsController < ApplicationController

  def create

    if @user = User.find_by(uid: auth[:uid])
      session[:user_id] = @user.id
    else
      @user = User.new(uid: auth[:uid])
      @user.name = auth[:info][:name]
      @user.email = auth[:info][:email]
    end
    if @user.save
      session[:user_id] = @user.id
    end
    
  end

  private
  def auth
    request.env['omniauth.auth']
  end
  
end