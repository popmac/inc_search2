class DeleteComment < ActiveRecord::Migration
  def change
    drop_table :comment
  end
end
