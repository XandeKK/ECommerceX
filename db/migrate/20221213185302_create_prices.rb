class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.string :stripe_price_id

      t.timestamps
    end
  end
end
