class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :review
      t.string :user_id
      t.string :tool_id
      t.timestamps
    end
  end
end
