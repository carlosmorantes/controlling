module AdminHelper
  # check permission
  def permission?
    if current_user.email != 'info@carrillomarket.com'
      true
    else
      false
    end
  end
end
