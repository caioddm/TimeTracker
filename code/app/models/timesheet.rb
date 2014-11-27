class Timesheet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :clockin, :clockout, :date, :minutes, :request_type,:user
  
  def self.get_period start_period, end_period
    start_period = Date.today
    end_period = Date.today
    day = Date.today.day
    month = Date.today.month
    if day > 9 && day < 26
      start_period = Date.new(Date.today.year, Date.today.month, 10)
      end_period = Date.new(Date.today.year, Date.today.month, 25)    
    elsif day <= 9
      start_period = Date.new(Date.today.month > 1 ? Date.today.year : Date.today.year - 1, Date.today.month > 1 ? Date.today.month - 1 : 12, 26)
      end_period = Date.new(Date.today.year, Date.today.month, 9)
    else
      start_period = Date.new(Date.today.year, Date.today.month, 26)
      end_period = Date.new(Date.today.month < 12 ? Date.today.year : Date.today.year + 1, Date.today.month < 12 ? Date.today.month + 1 : 1, 9)
    end
    return start_period, end_period
  end
end
