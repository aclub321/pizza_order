class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :discount_code, limit: 1

      t.timestamps
    end
  end
end
