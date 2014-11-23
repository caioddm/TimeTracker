class ManageusersController < SecureController
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to manageusers_path

  end
  
  def update
    @user = User.find(params[:id])
    ui_user = params[:user]
    ui_user.delete(:password)
    ui_user.delete(:password_confirmation)
    #calling update_attributes for validation checks
    if @user.update_attributes(ui_user)
      redirect_to manageusers_path
    else
      render 'edit'
    end
  end


  def index
    @users = User.where("is_user_active = ?", true)
  end

  def destroy
    @user = User.find(params[:id])
    @user.is_user_active = false
    @user.save

    redirect_to manageusers_path
  end
end
