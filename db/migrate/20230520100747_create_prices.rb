class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.integer :count
      t.references :valute, foreign_key: true
      t.references :price_datum, foreign_key: true
      t.timestamps
    end
  end
end
