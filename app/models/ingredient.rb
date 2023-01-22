class Ingredient < ApplicationRecord
  enum :state, {
    removed: 0,
    extra: 1
  }
end
