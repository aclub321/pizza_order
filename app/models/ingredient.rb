class Ingredient < ApplicationRecord
  enum :state, {
    removed: 0,
    add: 1
  }
end
