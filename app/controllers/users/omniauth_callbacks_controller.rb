# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
   authorization
  end

  def facebook
   authorization
  end

  def google_oauth2
   authorization
  end

  def failure
    authorization
  end

  private

  def authorization
    @user = User.from_omniauth(request.env["omniauth.auth"])
  end
end
