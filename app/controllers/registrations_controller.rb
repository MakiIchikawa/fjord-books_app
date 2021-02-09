# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)
    if @user.update_without_current_password(user_params)
      redirect_to @user, notice: t('controllers.common.notice_update', name: User.model_name.human)
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :name, :postal_code, :address, :self_introduction, :password, :password_confirmation, :current_password)
  end
end
