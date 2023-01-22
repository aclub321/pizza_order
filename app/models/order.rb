class Order < ApplicationRecord
  has_many :pizzas
  has_many :promotion_codes

  enum :discount_code, {
    SAVES: 0
  }

  scope :incomplete, -> { where(complete: false) }
end
