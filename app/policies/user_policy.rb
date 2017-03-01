class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @model = model
  end

  def update?
    @user.admin?
  end

  def amazon_table?
    @user.admin? || @user.superadmin?
  end

end
