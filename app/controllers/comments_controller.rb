class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
    @comments = @comment.post.comments
    @new_comment = Comment.new
    @new_comment.parent_id = @comment.id
    @new_comment.post_id = @comment.post_id
  end

  def create
    @comment = Comment.create!(params[:comment])
    redirect_to post_url(@comment.post)
  end
end
