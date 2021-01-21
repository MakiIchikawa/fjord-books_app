# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[postal_code street_address self_introduction])
  end
end
