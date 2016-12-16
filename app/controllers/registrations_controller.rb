class RegistrationsController < Devise::RegistrationsController
  def create
    super
    unless current_user.nil?
      cookies.signed[:user_id] = current_user.id
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end
