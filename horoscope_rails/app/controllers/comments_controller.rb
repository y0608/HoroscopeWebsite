# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
	load_and_authorize_resource
	
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @post.comments
  end

  def show
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

	end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post), notice: 'Comment was successfully deleted.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end