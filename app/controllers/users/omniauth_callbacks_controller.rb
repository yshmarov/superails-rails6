# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    handle_auth 'Google'
  end

  def github
    handle_auth 'Github'
  end

  def handle_auth(kind) # rubocop:todo Metrics/AbcSize
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: kind
      sign_in_and_redirect @user, event: :authentication
    else
      # rubocop:todo Layout/LineLength
      session['devise.auth_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
      # rubocop:enable Layout/LineLength
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    redirect_to root_path, alert: 'Something went wrong. Please try again.'
  end
end
