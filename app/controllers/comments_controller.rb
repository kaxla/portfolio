class CommentsController < ApplicationController
  before_action :load_commentable
  # def index
  #   @comments = policy_scope(Comment)
  # end

  def create
    @comment = @commentable.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        [@commentable, :comments] << @comment
        format.html { redirect_to @commentable, notice: 'Comment was successfully created.' }
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
    @comment = Comment.find(params[:id])
    authorize @comment
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @commentable, notice: 'Comment was successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @commentable.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body, :approved, :commentable_id)
  end

  # def load_post
  #   @post = Post.find(params[:post_id])
  # end

  def load_commentable
    @resource, id = request.path.split('/')[1, 2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
