class Pizza < ApplicationRecord
  belongs_to :order

  enum :pizza_type, {
    Margherita: 0,
    Salami: 1,
    Tonno: 2
  }

  enum :pizza_size, {
    Small: 0,
    Medium: 1,
    Large: 2
  }
end
