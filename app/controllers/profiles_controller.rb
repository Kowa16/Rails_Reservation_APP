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

  # def show
  #   @profile = Profile.find(params[:id])
  # end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)

      render :show
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:profile_name, :self_introduction, :profile_image)
  end

end
