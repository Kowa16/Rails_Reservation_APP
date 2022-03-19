class ProfilesController < ApplicationController

  def after_sign_up_path_for(resource)
      profiles_new_path
  end

  def index
   @profiles = Profile.all
  end

  def new
   @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    # profile_id = current_user.id
    @profile = Profile.find(id_params)

  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to room_path(@profile), notice: "更新しました。"
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:profile_name, :self_introduction)
  end

  def id_params
    params.require(:profile).permit(:profile_id)
  end
end
