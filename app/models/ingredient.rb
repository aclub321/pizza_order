class Ingredient < ApplicationRecord
  has_many :pizzas, through: :pizza_ingredients

  enum :name, {
    Onions: 0,
    Cheese: 1,
    Olives: 2
  }
end
