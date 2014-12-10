class AddFlagToTimesheet < ActiveRecord::Migration
  def change
     add_column :timesheets, :flag, :integer
  end
end
