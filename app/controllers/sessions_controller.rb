class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      sign_in user
      record_activity()
      if user.permission == 2
        redirect_to root_path
      end
      if user.permission == 1
        redirect_to root_path
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    record_activity()
    sign_out
    redirect_to root_url, notice: "Logged out!"
  end
end