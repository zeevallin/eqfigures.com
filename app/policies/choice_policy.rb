class ChoicePolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def create?
    return !!user
  end

  def destroy?
    return !!user
  end

end
