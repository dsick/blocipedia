class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if !user.nil? && user.admin?
        scope.all
      elsif !user.nil? && user.premium?
        scope.where("private = ? OR user_id = ?", false, user.id) 
        #private: false OR user_id: user.id )
      else
        scope.where(private: false)
      end
    end
  end

end
