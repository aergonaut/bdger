class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, notice: "Signed in!"
    else
      redirect_to badges_path
    end
  end
  alias_method :twitter, :all

  def after_omniauth_failure_path_for(scope)
    root_path
  end
end
