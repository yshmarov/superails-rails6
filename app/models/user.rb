# frozen_string_literal: true

class User < ApplicationRecord
  # :lockable, :timeoutable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable,
         :omniauthable, omniauth_providers: %i[google_oauth2 github]

  has_many :invitees, class_name: 'User', foreign_key: :invited_by_id, dependent: :nullify
  has_many :posts, dependent: :restrict_with_error

  acts_as_voter

  extend FriendlyId
  friendly_id :username, use: :slugged

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first

    user ||= User.create(
      email: access_token.info.email,
      password: Devise.friendly_token[0, 20],
      provider: access_token.provider,
      uid: access_token.uid,
      name: access_token.info.name,
      image: access_token.info.image
    )
    user.skip_confirmation!
    user.save

    user
  end

  after_create do
    Stripe::Customer.create(email: email)
    # customer = Stripe::Customer.create(email: email)
    # update(stripe_customer_id: customer.id)
  end

  def username
    if name?
      name
    else
      email.split(/@/).first
    end
  end

  after_create do
    update(name: username)
  end

  def active?
    subscription_status == 'active'
  end
end
