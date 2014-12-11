class AdminhomeController < AdminController
  def index
    
    start_period = Date.today
    end_period = Date.today
    if(params[:select_date] == nil || params[:select_date] =="" )
      select_date = Date.today
      period = Timesheet.get_period(start_period, end_period, select_date)
    else
      
      begin
       select_date= Date.strptime(params[:select_date], '%m/%d/%Y')
       period = Timesheet.get_period(start_period, end_period,select_date )
      rescue
        flash[:notice] = "Invalid date format"
        period = Timesheet.get_period(start_period, end_period, Date.today)            
      end
    end
    @start_period = period[0]
    @end_period = period[1]
    @timesheet = Timesheet.joins(:user).where("date >= ? AND date <= ?", @start_period, @end_period).group([:user_id,:request_type]).select("name,last_name,user_id, sum(minutes) as minutes,request_type").order(:last_name,:name)
    if(params[:user_name] != nil && params[:user_name] != "")
      @timesheet = @timesheet.where("name Like ? OR last_name like ?","%"+params[:user_name]+"%","%"+params[:user_name]+"%")
      #@timesheet = @timesheet.where("user_id IN ?",timesheet_user.id)
    end 
    
     
  end
    
  def search
    date = params[:date]
    name = params[:name]
    
    redirect_to adminhome_index_path({:select_date => date, :user_name => name})
  end
end
