class ApplicationController < ActionController::Base
  before_action :user_parameters, if: :devise_controller?

  def after_sign_in_path_for(*)
    return if admin_signed_in?
    au_pairs_path
  end

  protected

  def user_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[main_responsible
                                               second_responsible
                                               main_phone
                                               second_phone])
  end
end
