class ReviewsController < ApplicationController

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to controller: :users, action: :index
  end

end
