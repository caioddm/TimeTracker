class AdminController < SecureController  
  before_filter :admin_user
  
  def admin_user    
    authenticate_user!
    if current_user.is_admin == false
      redirect_to :controller=>'userhome', :action => 'index' and return
  end
  end
end
