class SessionsController < ApplicationController

  def create
    user = User.find_by(uid: auth[:uid])
    if user
      session[:user_id] = user.id
    else
      @user = User.find_or_create_by(uid: auth[:uid]) do |user|
        user.name = auth[:info][:name]
        user.email = auth[:info][:email]
        user.password = SecureRandom.hex
      end
      if @user.save
        session[:user_id] = @user.id
      end
    end
    
  end

  private
  def auth
    request.env['omniauth.auth']
  end
  
end