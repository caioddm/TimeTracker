class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :requests, :type, :request_type
    
    rename_column :timesheets, :type, :request_type
  end
end
