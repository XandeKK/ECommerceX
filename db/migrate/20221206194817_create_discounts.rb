class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts, id: :uuid do |t|
      t.string :name
      t.string :desc
      t.float :discount_percent
      t.boolean :active
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
