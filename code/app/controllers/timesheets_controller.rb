class TimesheetsController < ApplicationController
 
  def create
    if(params[:commit] == "Clock-In")
      @t = Time.now()
      @id = current_user.user_id
      @timesheet = Timesheet.create(:date => t, :clockin =>t,:request_type =>"regular")
      timesheet.save! 
      redirect_to users_url
     
    end
  end
  
  def new
    
  end
end
