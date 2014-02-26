class AddingIndexToStatusTable < ActiveRecord::Migration
  def change
  	add_index :statuses, :user_id
  end
end
