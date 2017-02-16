module AdminHelper
  # check permission
  def permission?(role)
    current_user.role == role ? true : false
  end
end
