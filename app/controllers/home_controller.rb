class HomeController < ActionController::Base
	layout 'application'

	def home
		@posts = Post.all
		@posts = @posts.sort_by { |x| -x.likes.size }
	end
end