class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.string :sku
      t.text :desc

      t.timestamps
    end
  end
end
