class ChangeColumnNameTypeInIngredient < ActiveRecord::Migration[7.0]
  def up
    change_column :ingredients, :name, :integer, limit: 1, null: false
  end

  def down
    change_column :ingredients, :name, :string
  end
end
