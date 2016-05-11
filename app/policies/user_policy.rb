class UserPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    skip_authorization
  end

  def new?
    skip_authorization
  end

  def update?
    user.present?
  end

  def edit?
    user.present?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
