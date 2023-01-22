class RemoveColumnStateFromIngredient < ActiveRecord::Migration[7.0]
  def change
    remove_column :ingredients, :state
  end
end
