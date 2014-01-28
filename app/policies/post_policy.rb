class PostPolicy < ApplicationPolicy
    attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    @user.editor?
  end

  def create?
    @user.role == "editor" || "author"
  end
end


  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end


end
