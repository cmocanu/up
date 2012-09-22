class CommentsController < ActionController::Base
	include SessionsHelper
	layout 'application'

	def create
		if signed_in?
			post = Post.find(params[:post_id])
			comment = post.comments.create(params[:comment])
			comment.user = current_user
			if comment.save
				flash[:success] = "Comment posted"
				redirect_to post
			end
		else
			flash[:error] = "Must sign in first"
			redirect_to signin_path
		end
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def reply
		comment = Comment.find(params[:id])
		child = comment.children.build(params[:reply])
		child.user = current_user
		child.post = comment.post
		if child.save
			flash[:success] = "Reply posted"
			redirect_to comment.post
		else
			flash[:error] = "Reply failed"
			redirect_to comment.post
		end
	end

	def upvote
		comment = Comment.find(params[:id])
		current_user.likes comment
		flash[:success] = "Comment upvoted"
		redirect_to comment.post
	end

end