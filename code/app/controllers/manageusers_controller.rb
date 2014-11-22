class ManageusersController < SecureController
	def new
		
	end	
	
	def authenticate_user!
	end
	
	def create
		@user = User.new(params[:user])
		@user.save
		redirect_to manageusers_path
		
	end
	
	def index
		@users = User.all
	end
	
	def destroy
	  @user = User.find(params[:id])
	  @user.destroy
	  
	  redirect_to manageusers_path
	end
end
	