class UserhomeController < SecureController
  def index
    if current_user.is_admin == true
      redirect_to :controller=>'adminhome', :action => 'index' and return
          
    if current_user
      @user = current_user
      @timesheets= @user.timesheets
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user } 
    end  
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.' and return
    end
   
    end
  end
end
