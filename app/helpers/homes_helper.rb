module HomesHelper
  def hide_side_bar?
    request.path == new_user_session_path || request.path == new_user_registration_path || request.path == new_user_password_path || request.path == root_path || request.path == user_registration_path
  end
end
