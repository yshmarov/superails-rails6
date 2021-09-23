# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :post
  belongs_to :tag
end
