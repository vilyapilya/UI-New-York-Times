class SessionsController < ApplicationController

  def new
    render :login
  end

  def cerate
    u = User.new(user_params)
    if u.is_password?(:password)
      User.reset_session_token!
      redirect_to cats_url
    else
      render :new
    end
  end
end
