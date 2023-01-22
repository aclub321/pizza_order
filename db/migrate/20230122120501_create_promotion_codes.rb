class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_codes do |t|
      t.integer :code, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
