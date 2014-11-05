class UserhomeController < SecureController
  def index
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index'
    end
  end
end
