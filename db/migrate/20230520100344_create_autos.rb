class CreateAutos < ActiveRecord::Migration[7.0]
  def change
    create_table :autos do |t|
      t.boolean :is_new
      t.integer :year
      t.integer :mileage
      t.references :type_auto, foreign_key: true
      t.references :model_marka_auto, foreign_key: true
      t.references :type_kuzov, foreign_key: true
      t.references :country, foreign_key: true
      t.references :color, foreign_key: true
      t.references :type_fuel, foreign_key: true
      t.references :type_transmission, foreign_key: true
      t.references :type_drive_auto, foreign_key: true

      t.timestamps
    end
  end
end
