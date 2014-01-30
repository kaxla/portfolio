class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    # @comment.save

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

private

  def comment_params
    params.require(:comment).permit(:body) #(:published if PostPolicy.new(current_user, @post).publish?))
  end
end
end
