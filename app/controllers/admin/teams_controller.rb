class Admin::TeamsController < ApplicationController
	def index
    @teams = Team.paginate page: params[:page], per_page: 5 
  end

  def show
    @team = Team.find params[:id]
  end

  def destroy
    @team = Team.find params[:id]
    @team.users.each do |user|
      user.update_attributes leader_flag: 0
      @team.users.delete user
    end
    if @team.destroy
      flash[:success] = "Success destroyed"
    else
      flash[:error] = "Destroy Failed"
    end
    redirect_to admin_teams_path
  end

  def edit
    @team = Team.find params[:id]
  end

  def new
    @free_members = User.free_members
    @team = Team.new
  end

  def create
    @team = Team.new team_params
    if !params[:leader_id].nil? and params[:user_ids].respond_to?(:each)
      Team.transaction do
        User.transaction(requires_new: false) do
          params[:user_ids].each do |user_id|
            @user = User.find user_id
            @team.users << @user
          end
          @leader = User.find params[:leader_id]
          @team.users << @leader
          @leader.update_attributes leader_flag: 1
          @team.save
          flash[:success] = "Created team"
        end
      end
      redirect_to admin_teams_path
    else
      flash[:error] = "Failed create team"
      redirect_to new_admin_team_path
    end
  end

  def update
    @team = Team.find params[:id]
    if !@team.nil?
      if @team.update_attributes team_params
        flash.now[:success] = "Updated team"
        redirect_to admin_teams_path
      else
        render :edit
      end
    else
      render root_path
    end
  end

  def team_params
    params.require(:team).permit(:name, :description )
  end
end
