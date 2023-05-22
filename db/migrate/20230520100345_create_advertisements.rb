class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :text
      t.references :user, foreign_key: true
      t.references :auto, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
