PostPolicy = Struct.new(:user, :post) do
  self::Scope = Struct.new(:user, :scope)do

    def resolve
      if user.present? && user.editor?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def publish?
   user.present? && user.editor?
  end

  def create?
    user.present? && (user.editor? || user.author?)
  end

  def destroy?
    user.present? && (user.editor? || user.author?)
  end

  def update?
    user.present? && (user.editor? || user.author?)
  end

end
