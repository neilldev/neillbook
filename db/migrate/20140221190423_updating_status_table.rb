class UpdatingStatusTable < ActiveRecord::Migration
  def change
  	remove_column :statuses, :name
  end
end
