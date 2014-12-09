class Timesheet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :clockin, :clockout, :date, :minutes, :request_type,:user
  
  def self.get_period start_period, end_period
    start_period = Date.today
    end_period = Date.today
    day = Date.today.day
    month = Date.today.month
    if day > 10 && day < 26
      start_period = Date.new(Date.today.year, Date.today.month, 11)
      end_period = Date.new(Date.today.year, Date.today.month, 25)    
    elsif day <= 10
      start_period = Date.new(Date.today.month > 1 ? Date.today.year : Date.today.year - 1, Date.today.month > 1 ? Date.today.month - 1 : 12, 26)
      end_period = Date.new(Date.today.year, Date.today.month, 10)
    else
      start_period = Date.new(Date.today.year, Date.today.month, 26)
      end_period = Date.new(Date.today.month < 12 ? Date.today.year : Date.today.year + 1, Date.today.month < 12 ? Date.today.month + 1 : 1, 10)
    end
    return start_period, end_period
  end
  
  def self.getMinutesInHours(min)
    result = "00:00";
    if(min != nil)
      leftMinutes = min % 60;
      fullHours = (min/60).floor;
      if(leftMinutes > 7 && leftMinutes < 23)
        leftMinutes = 15;
      elsif (leftMinutes > 23 && leftMinutes < 37)
        leftMinutes = 30;
      elsif (leftMinutes > 37 && leftMinutes < 53)
        leftMinutes = 45;
      else
        leftMinutes = 0;
      end      
      result = fullHours.to_s().rjust(2, '0') + ":" + leftMinutes.to_s().rjust(2, '0');
    else
      result = "00:00";
    end
    return result;  
  end
  
  def getMinutesInHours
    result = "00:00";
    if(minutes != nil)
      leftMinutes = minutes % 60;
      fullHours = (minutes/60).floor;
      if(leftMinutes > 7 && leftMinutes < 23)
        leftMinutes = 15;
      elsif (leftMinutes > 23 && leftMinutes < 37)
        leftMinutes = 30;
      elsif (leftMinutes > 37 && leftMinutes < 53)
        leftMinutes = 45;
      else
        leftMinutes = 0;
      end      
      result = fullHours.to_s().rjust(2, '0') + ":" + leftMinutes.to_s().rjust(2, '0');
    else
      result = "00:00";
    end
    return result;    
  end
end
