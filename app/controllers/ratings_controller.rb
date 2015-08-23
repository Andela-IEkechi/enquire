class RatingsController < ApplicationController # todo we should be able to do without this whole controller

  def update
    @rating = Rating.find(params[:id])
    @article = @rating.article
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

end