class PromotionCode < ApplicationRecord
  belongs_to :order

  enum :code, {
    '2FOR1' => 0
  }
end
