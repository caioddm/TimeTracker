class UserhomeController < SecureController
  def index
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index' and return
    end    
    start_period = Date.today
    end_period = Date.today
    period = Timesheet.get_period start_period, end_period
    @start_period = period[0]
    @end_period = period[1]
    @timesheets = current_user.timesheets.where("date >= ? AND date <= ?", @start_period, @end_period)
  end
end
