class ProfilesController < ApplicationController
  def index
   @profiles = Profile.all
  end

  def new
   @profile = Profile.new
  end

  def create
    @profile = Profile.new(room_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to :profiles
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(room_params)
      redirect_to room_path(@profile), notice: "更新しました。"
    else
      render :edit
    end
  end
end
