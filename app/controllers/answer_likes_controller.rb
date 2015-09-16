class AnswerLikesController < ApplicationController
  before_action :set_appreciate, only: [:destroy]
  load_and_authorize_resource

  def new
    @appreciate = AnswerLike.new
  end

  def create
    @appreciate = AnswerLike.new(answer_like_params)
    @appreciate.user = current_user
    @appreciate.save
    redirect_to :back
  end

  def destroy
    @appreciate.destroy
    redirect_to :back
  end

  private

  def set_appreciate
    @appreciate = AnswerLike.find(params[:id])
  end

  def answer_like_params
    params.permit(:answer_id, :user_id)
  end
end