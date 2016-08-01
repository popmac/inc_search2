class ReviewsController < ApplicationController

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    @tool_id = review.tool.id
    if review.user_id.to_i == current_user.id
      review.update(update_params)
      redirect_to root_path
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to controller: :users, action: :index
  end

  private
  def update_params
    params.require(:review).permit(:review).merge(user_id: current_user.id, tool_id: @tool_id)
  end

end
