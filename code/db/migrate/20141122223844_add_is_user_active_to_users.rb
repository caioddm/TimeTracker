class AddIsUserActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_user_active, :boolean, :default => true
  end
end
