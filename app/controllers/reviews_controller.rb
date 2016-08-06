class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    @tool_id = review.tool.id
    review.update(update_params)
    redirect_to root_path
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
