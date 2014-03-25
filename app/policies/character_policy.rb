class CharacterPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def show?
    return false unless user
    return user.admin?
  end

  def create?
    return false unless user
    return user.admin?
  end

  def update?
    return false unless user
    return user.admin?
  end

  def destroy?
    return false unless user
    return user.admin?
  end

end
