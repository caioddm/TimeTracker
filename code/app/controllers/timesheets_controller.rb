class TimesheetsController < ApplicationController
 
  def create
    if(params[:commit] == "Clock-In")
      @d = Date.today
      @t = Time.zone.now
      @timesheet = Timesheet.new(:date => @d , :clockin =>@t,:request_type =>"regular")
      @timesheet.user=current_user
      @timesheet.save
      redirect_to :root
    end
    if(params[:commit] == "Clock-Out")
      @d = Date.today
      @timesheet = current_user.timesheets
      @timesheet2 = @timesheet.where("date = ? AND clockout IS NULL",@d).first
      @time1 = @timesheet2.clockin
      @time2 = Time.zone.now
      @minutes = TimeDifference.between(@time1, @time2).in_minutes
      @timesheet2.update_attributes(clockout: @time2,minutes: @minutes)
      @timesheet2.save
      redirect_to :root
    end  
  end
  
  def new
    
  end
end
