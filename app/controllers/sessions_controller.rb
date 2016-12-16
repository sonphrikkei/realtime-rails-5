class SessionsController < Devise::SessionsController
  def create
    unless current_user.nil?
      cookies.signed[:user_id] = current_user.id
    end
    super
  end

  def destroy
    current_user.offline
    cookies.signed[:user_id] = nil
    super
  end
end
