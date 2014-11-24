class TimesheetsController < ApplicationController
 
  def create
    if(params[:commit] == "Clock-In")
      @d = Date.today()
      @t = Time.zone.now()
      @timesheet = Timesheet.new(:date => @d , :clockin =>@t,:request_type =>"regular")
      @timesheet.user=current_user
      @timesheet.save
      redirect_to :root
    end
    if(params[:commit] == "Clock-Out")
      @t = Time.zone.now();
      @d = Date.today()
      @timesheet = current_user.timesheets
      @timesheet2 = @timesheet.where("date = ? AND clockout IS NULL",@d).first
      @time1 = @timesheet2.clockin
      @time2 = Time.zone.now()
      @hours =((@time2 - @time1) / 3600).round
      @timesheet2.update_attributes(clockout: @time2,minutes: @hours) 
      @timesheet2.save
      redirect_to :root
    end  
  end
  
  def new
    
  end
end
