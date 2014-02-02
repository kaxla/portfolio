class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    comment.publish?
  end

  def approve?
    if @user.nil?
      false
    else
      @user.author? || @user.editor?
    end
  end
end

