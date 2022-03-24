class TopPagesController < ApplicationController
  def home
    @profile = Profile.all
  end
end
