class MealProviderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      # scope is MealProvider
      scope.all
    end
  end

  def create?
    true #All users can create a mp
  end

  def show?
    true #All users can see the mp's
  end

  def update?
    # only owner can modify
    # record => the mp you want to update
    # user => current_user
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user.admin || record.user == user #returns a boolean
  end
end
