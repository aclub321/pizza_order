class AddColumnCompleteToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :complete, :boolean, default: false, null: false
  end
end
