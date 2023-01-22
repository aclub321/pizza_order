class Order < ApplicationRecord
  scope :incomplete, -> { where(complete: false) }
end
