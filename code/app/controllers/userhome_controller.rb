class UserhomeController < SecureController
  def index
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index' and return
    end
    if params[:start_period] != nil && params[:end_period] != nil
      start_period = params[:start_period];
      end_period = params[:end_period];
      @start_period = start_period.to_date
      @end_period = end_period.to_date
  
    else
      start_period = Date.today
      end_period = Date.today  
      period = Timesheet.get_period start_period, end_period
      @start_period = period[0]
      @end_period = period[1]
  
    end    
    @timesheets = current_user.timesheets.where("date >= ? AND date <= ?", @start_period, @end_period)
  end
end
