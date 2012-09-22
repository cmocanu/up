class SessionsController < ApplicationController
	include SessionsHelper

	def new
		@user = User.new
	end

	def create
		user = User.where("name = ?", params[:session][:name]).first
		if user && user.authenticate(params[:session][:password])
			token = SecureRandom.urlsafe_base64
			user.token = token
			user.save
			sign_in(user, token)
			redirect_to root_path
		else
			flash[:error] = "Signin failed, please try again"
			redirect_to signin_path
		end
	end

	def destroy
		sign_out
		flash[:success] = "Succesfully signed out" 
		redirect_to root_path
	end
end
