class AdminhomeController < AdminController
  def index
    
    start_period = Date.today
    end_period = Date.today
    period = Timesheet.get_period start_period, end_period
    @start_period = period[0]
    @end_period = period[1]
    @timesheet = Timesheet.joins(:user).where("date >= ? AND date <= ?", @start_period, @end_period).group([:user_id,:request_type]).select("user_id, sum(minutes) as minutes,request_type").order(:name)
  end
end
