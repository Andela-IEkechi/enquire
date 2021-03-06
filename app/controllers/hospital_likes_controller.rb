class HospitalLikesController < ApplicationController
  before_action :set_recommend, only: [:destroy]
  load_and_authorize_resource

  def new
    @recommend = HospitalLike.new
  end

  def create
    @recommend = HospitalLike.new(hospital_like_params)
    @recommend.user = current_user
    @recommend.save
    redirect_to :back
  end

  def destroy
    @recommend.destroy
    redirect_to :back
  end

  def set_recommend
    @recommend = HospitalLike.find(params[:id])
  end

  def hospital_like_params
    params.require(:hospital_like).permit(:hospital_id, :user_id)
  end
end