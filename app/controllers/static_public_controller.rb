# frozen_string_literal: true
class StaticPublicController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[landing_page privacy]
  skip_before_action :authenticate_user!

  def landing_page
  end

  def pricing
    @pricing = Stripe::Price.list(lookup_keys: %w[pro_monthly pro_yearly],
                                  expand: ['data.product']).data.sort_by do |p|
      p.unit_amount
    end
  end

  def privacy
  end

  def about
  end

  def terms
  end
end
