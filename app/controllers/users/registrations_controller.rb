# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /users/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_session_path, notice: '登録しました'
    else
      render :new
    end
  end

  # GET /resource/edit
  def edit
    @user = User.find(current_user.id)
  end

  # PUT /resource
  def update
    user = User.find(current_user.id)
    if user.update_without_password(user_params)
      redirect_to users_show_path(user), notice: '更新しました'
    else
      render :edit
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :postal_code, :street_address, :self_introduction)
  end

  protected

  def update_resource(resource, params)
    if params[:password].present? && params[:password_confirmation].present?
      resource.update(params)
    else
      resource.update_without_password(params)
    end
  end
end
