class Order < ApplicationRecord
  has_many :pizzas

  enum :discount_code, {
    SAVES: 0
  }

  scope :incomplete, -> { where(complete: false) }
end
