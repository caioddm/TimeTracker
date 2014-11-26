class UserhomeController < SecureController
  def index
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index' and return
    end      
      @timesheets= current_user.timesheets
  end
end
