class UserhomeController < SecureController
  def index
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index' and return
    end    
    Timesheet.get_period start_period, end_period
    @start_period = start_period
    @end_period = end_period
    @timesheets = current_user.timesheets.where("date >= ? AND date <= ?", start_period, end_period)
  end
end
