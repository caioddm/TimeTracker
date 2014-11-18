class AddDefaultToRequestStatus < ActiveRecord::Migration
  def change
    rename_column :requests, :integer, :status
    
    change_column :requests, :status, :integer, default: 0
  end
end
