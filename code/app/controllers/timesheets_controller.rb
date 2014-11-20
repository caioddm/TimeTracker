class TimesheetsController < ApplicationController
  def create
    if(params[:commit] == "Clock-In")
      @t = Time.now()
      new_time_sheet = Timesheet.new(:date => t, :clockin => t,:request_type => "regular",:user_id => current_user.id)
      new_time_sheet.save! 
    end
  end
end
