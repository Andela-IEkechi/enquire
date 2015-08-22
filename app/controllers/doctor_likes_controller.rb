class DoctorLikesController < ApplicationController
  before_action :set_like_doctor, only: [:destroy]
  load_and_authorize_resource

  def new
    @like_doctor = DoctorLike.new
  end

  def create
    @like_doctor = DoctorLike.new(doctor_like_params)
    @like_doctor.save
    redirect_to :back
  end

  def destroy
    @like_doctor.destroy
    redirect_to :back
  end

  private

  def set_like_doctor
    @like_doctor = DoctorLike.find(params[:id])
  end

  def doctor_like_params
    params.require(:doctor_like).permit(:doctor_id, :user_id)
  end
end