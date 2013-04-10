class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.user_id = cookies[:current_user]
  end

  def create
    @post = Post.new(params[:post])
    @post.save! # REV What id the save fails?
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @votes = Vote.new
    @votes.user_id = cookies[:current_user]
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @new_comment = Comment.new
    @new_comment.post_id = @post.id
  end

end
