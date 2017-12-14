class RegistrationsController < Devise::RegistrationsController
  layout "application"
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :current_password)
  end
end
