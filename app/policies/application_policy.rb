class ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @model = model
  end

  def superadmin?
    @user.superadmin?
  end
end
