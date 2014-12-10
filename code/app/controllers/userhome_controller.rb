class UserhomeController < SecureController
  def index
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index' and return
    end
        
    if current_user
      start_period = Date.today
      end_period = Date.today
      day = Date.today.day
      month = Date.today.month
      if day > 9 && day < 26
        start_period = Date.new(Date.today.year, Date.today.month, 10)
        end_period = Date.new(Date.today.year, Date.today.month, 25)    
      elsif day <= 9
        start_period = Date.new(Date.today.month > 1 ? Date.today.year : Date.today.year - 1, Date.today.month > 1 ? Date.today.month - 1 : 12, 26)
        end_period = Date.new(Date.today.year, Date.today.month, 9)
      else
        start_period = Date.new(Date.today.year, Date.today.month, 26)
        end_period = Date.new(Date.today.month < 12 ? Date.today.year : Date.today.year + 1, Date.today.month < 12 ? Date.today.month + 1 : 1, 9)
      end  
      @user = current_user
      @timesheets= @user.timesheets.where({date: start_period.beginning_of_day..end_period.end_of_day})
      @start_period = start_period
      @end_period = end_period
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.' and return
    end
  end
end
