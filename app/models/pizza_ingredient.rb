class PizzaIngredient < ApplicationRecord
  belongs_to :pizza
  belongs_to :ingredient

  enum :state, {
    remove: 0,
    add: 1
  }

  scope :removed, -> { where(state: :remove) }
  scope :added, -> { where(state: :add) }
end
