class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    !user.nil?
  end

  def show?
    !user.nil?
  end

  def update?
    !user.nil?
  end
end
