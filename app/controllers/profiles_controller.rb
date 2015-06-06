class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  load_and_authorize_resource

  def index
    @clients = User.client
    @doctors = User.is_doctor
    @managers = User.manager
  end

  def show
  end

  private
    def set_profile
      @profile = User.find(params[:id])
    end
end
