CommentPolicy = Struct.new(:user, :comment) do

  self::Scope = Struct.new(:user, :scope)do
    def resolve
      if user.present? && (user.editor? || user.author?)
        scope.all
      else
        scope.where(:approved => true)
      end
    end
  end

  def approve?
    user.present? && (user.editor? || user.author?)
  end

  alias :update? :approve?

end
