# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end
