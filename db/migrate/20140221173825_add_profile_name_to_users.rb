class AddProfileNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profileName, :string
  end
end
