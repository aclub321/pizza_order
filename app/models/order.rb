class Order < ApplicationRecord
  enum :discount, {
    SAVES: 0
  }

  scope :incomplete, -> { where(complete: false) }
end
