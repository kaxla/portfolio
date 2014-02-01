# PostsPolicy = Struct.new(:user, :post) do

#   def publish?
#     @post.editor?
#   end

#   def create?
#     @post.editor? || @post.author?
#   end
# end

# # PostPolicy = Struct.new(:user, :post)

class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    @user.editor? && post.published? == false
  end

  def create?
    return unless @user.present?
    user.editor? || user.author?
  end

  def destroy?
    return unless @user.present?
    user.editor? || user.author?
  end

  def update?
    return unless @user.present?
    user.editor? || user.author?
  end

end
