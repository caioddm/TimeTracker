class EmployeeController < SecureController  
  before_filter :employee_user
  
  def employee_user    
    authenticate_user!
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index' and return
  end
  end
end
