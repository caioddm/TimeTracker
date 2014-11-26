 class UpdateRequestClockinClockout < ActiveRecord::Migration
    def change
    change_column :requests, :clockin, :datetime
    
    change_column :requests, :clockout, :datetime
  end
end
