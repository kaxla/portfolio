class CommentsController < ApplicationController
  before_action :load_post, only: [:create, :edit, :update]


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

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @post
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
