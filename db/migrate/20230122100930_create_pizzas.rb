class CreatePizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :pizzas do |t|
      t.integer :type, limit: 1
      t.integer :size, limit: 1
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
