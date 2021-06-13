class StaticPublicController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[landing_page privacy]
  skip_before_action :authenticate_user!

  def landing_page
  end

  def privacy
  end

  def terms
  end
end
