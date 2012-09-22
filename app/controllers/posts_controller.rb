class PostsController < ActionController::Base
	layout 'application'
	include SessionsHelper

	def new
		@post = Post.new
	end

	def create
		if signed_in?
			@post = Post.new(params[:post])
			@post.link = make_link(@post.link)
			@post.user = current_user
			if @post.save
				flash[:success] = "Your submission has been saved"
				redirect_to root_path
			else
				flash[:error] = "Submission not valid"
				render "new"
			end
		else
			flash[:error] = "Must be signed in first"
			redirect_to signin_path
		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = Post.find(params[:id]).comments.find_all { |com| com.parent == nil }
		@comments = @comments.sort_by { |x| -x.likes.size }
	end

	def upvote
		post = Post.find(params[:id])
		current_user.likes post
		redirect_to root_path
	end

	protected

		def make_link (link)
			if (link.include? "http://") || (link.include? "https://")
				link
			else
				"http://" + link
			end
		end
end