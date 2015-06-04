class DoctorsController < ApplicationController
  before_action :select_doctor, only: [:show]

  def index
    @doctors = User.is_doctor
  end

  def show
  end

  private

  def select_doctor
    @doctor = Doctor.find(params[:id])
  end
end
