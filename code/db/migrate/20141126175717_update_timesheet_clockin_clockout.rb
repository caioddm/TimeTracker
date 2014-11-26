class UpdateTimesheetClockinClockout < ActiveRecord::Migration
  def change
    change_column :timesheets, :clockin, :datetime
    
    change_column :timesheets, :clockout, :datetime
  end
end
