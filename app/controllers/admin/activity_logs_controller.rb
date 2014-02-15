class Admin::ActivityLogsController < ApplicationController
	def index
		@activities = Log.all
	end
	def destroy
    log = Log.find params[:id]
		if log.destroy
      flash[:success] = "Success destroyed"
    else
      flash[:error] = "Destroy Failed"
    end
    redirect_to admin_activity_logs_path
	end
end
