class AdminController < ApplicationController
  before_action :superadmin_authenticate

  def users
    @users = User.all
  end
end
