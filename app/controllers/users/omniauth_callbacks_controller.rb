# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
   authorization
  end

  def google_oauth2
   authorization
  end

  private
  def authorization
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      render template: 'devise/registrations/new'
    end
  end
end
