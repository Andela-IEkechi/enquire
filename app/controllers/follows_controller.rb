class FollowsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    @follow = Follow.new(follow_params)
    @follow.user = current_user

    respond_to do |format|
      if @follow.save
        format.html { redirect_to :back, notice: 'You have successfully followed the Question.' }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def follow_params
    params.require(:follow).permit(:question_id, :user_id)
  end
end
