class AnswerLikesController < ApplicationController
  before_action :set_appreciate, only: [:destroy]

  def new
    @appreciate = AnswerLike.new
  end

  def create
    @appreciate = AnswerLike.new(answer_like_params)
    @appreciate.save
    redirect_to :back
  end

  def destroy
    @appreciate.destroy
    redirect_to :back
  end

  def set_appreciate
    @appreciate = AnswerLike.find(params[:id])
  end

  def answer_like_params
    params.require(:answer_like).permit(:answer_id, :user_id)
  end
end