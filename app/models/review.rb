class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool
  has_many :likes, dependent: :destroy
  has_many :comments
  validates :review, presence: true
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
