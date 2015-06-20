class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]

  def index
    @clients = User.is_client
    @doctors = User.is_verified_doctor
    @managers = User.is_manager
  end

  def show
  end

  private
    def set_profile
      @profile = User.find(params[:id])
    end
end
