class AmazonPolicy < ApplicationPolicy

  def amazon_table?
    @user.admin? || @user.superadmin?
  end

end
