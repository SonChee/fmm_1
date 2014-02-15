class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def record_activity()
    @activity = Log.new
    @activity.user = current_user
    @activity.note = action_name
    @activity.browser = request.env['HTTP_USER_AGENT']
    @activity.ip_address = request.env['REMOTE_ADDR']
    @activity.controller = controller_name 
    @activity.action = action_name 
    @activity.params = params.inspect
    @activity.save
  end
end
