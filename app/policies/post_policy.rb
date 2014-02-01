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
    user.editor?
    # if @user
    #   @user.role == "editor"
    # end
  end

  def create?
    user.editor? || user.author?
  end

  def new_post?
    if @user
      @user.role == "editor" || @user.role =="author"
    end
  end

end
