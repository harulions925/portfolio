class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  #以下追加したコード
  before_action :configure_permitted_parameters,
                if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:name]
    )

    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:name, :profile]
    )
  end
end
