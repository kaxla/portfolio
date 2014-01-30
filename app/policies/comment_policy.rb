class CommentPolicy
  attr_reader :post, :comment

  def initialize(post, comment)
    @post = post
    @comment = comment
  end

  def create?
    true
    # user.author? or user.editor?
  end
end

