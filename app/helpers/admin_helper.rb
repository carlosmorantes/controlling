module AdminHelper
  # check permission
  def permission?
    if current_user.email != 'info@carrillomarket.com' && current_user.email != 'angy@carrillomarket.com'
      true
    else
      false
    end
  end
end
