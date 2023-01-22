class ConvertColumnTypeToPizzaType < ActiveRecord::Migration[7.0]
  def change
    rename_column :pizzas, :type, :pizza_type
  end
end
