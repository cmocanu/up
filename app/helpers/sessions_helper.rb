module SessionsHelper

	def sign_in(user, token)		
		cookies.permanent[:remember_token] = token
		self.current_user = user
	end

	def sign_out
		cookies.delete(:remember_token)
	end

	def signed_in?
		!self.current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.where("token = ?", cookies[:remember_token]).first
	end

end

