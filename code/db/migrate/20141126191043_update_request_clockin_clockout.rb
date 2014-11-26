 class UpdateRequestClockinClockout < ActiveRecord::Migration
    def change
    change_column :requests, :start, :datetime
    
    change_column :requests, :end, :datetime
  end
end
