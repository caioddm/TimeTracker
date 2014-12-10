class ManageusersController < AdminController

  before_filter :check_for_cancel, :only => [:create, :update]
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to manageusers_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

 def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    Rails.logger=Logger.new(STDOUT)
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to manageusers_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @request }
      else
        logger.info('Error creating the user')
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
    @users = User.where("is_user_active = ?", true).order(:last_name)
  end

  def destroy
    @user = User.find(params[:id])
    @user.is_user_active = false
    @user.save

    redirect_to manageusers_path
  end
end
