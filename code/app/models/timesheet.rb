class Timesheet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :clockin, :clockout, :date, :minutes, :request_type,:user
end
