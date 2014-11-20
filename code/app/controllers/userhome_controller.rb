class UserhomeController < SecureController
  def index
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index'
          
    if current_user
      @sheets = current_user.timesheets
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
   
    end
  end
end
