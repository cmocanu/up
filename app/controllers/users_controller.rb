class UsersController < ActionController::Base
	layout 'application'

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:success] = "Account created successfuly"
			redirect_to root_path
		else
			render 'new'
		end
	end

end