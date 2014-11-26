class ManageusersController < SecureController

  before_filter :check_for_cancel, :only => [:create, :update]
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to manageusers_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to manageusers_path

  end

  def update
    #TODO: check for deactivated user
    @user = User.find(params[:id])
    ui_user = params[:user]
    if ui_user[:password].nil? || ui_user[:password].empty?
      ui_user.delete(:password)
    end
    ui_user.delete(:password_confirmation)
    #calling update_attributes for validation checks
    if @user.update_attributes(ui_user)
      redirect_to manageusers_path
    else
    #TODO: show error messages
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
