class AdminhomeController < AdminController
  def index
    @timesheet = Timesheet.joins(:user).group([:user_id,:request_type]).select("user_id, sum(minutes) as minutes,request_type").order(:name)
  end
end
