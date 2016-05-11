class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    skip_authorization
  end

  def show?
    user.standard?
  end

  def create?
    user.present?
  end

  def new?
    skip_authorization
  end

  def update?
    user.present?
  end

  def edit?
    user.standard?
  end

  def destroy?
    user.admin?
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
