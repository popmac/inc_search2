class AddReviewIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :review_id, :integer
  end
end
