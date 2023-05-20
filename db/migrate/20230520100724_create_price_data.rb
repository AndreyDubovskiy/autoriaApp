class CreatePriceData < ActiveRecord::Migration[7.0]
  def change
    create_table :price_data do |t|
      t.date :date
      t.references :advertisement, foreign_key: true
      t.timestamps
    end
  end
end
