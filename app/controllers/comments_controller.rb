class CommentsController < ApplicationController
  before_action :load_post, only: [:create, :edit, :update]

  # def index
  #   @comments = policy_scope(Comment)
  # end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.approved? == false
    respond_to do |format|
      if @comment.save
        @post.comments << @comment
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # def show
  #   # @post = Post.find(params[:post_id])
  #   @post.comments = Comment.find(@post.comment(params[:id]))

  def update
    authorize @comment
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice, 'Comment was successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body, :approved)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
