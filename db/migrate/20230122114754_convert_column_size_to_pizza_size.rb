class ConvertColumnSizeToPizzaSize < ActiveRecord::Migration[7.0]
  def change
    rename_column :pizzas, :size, :pizza_size
  end
end
