class CreateModelMarkaAutos < ActiveRecord::Migration[7.0]
  def change
    create_table :model_marka_autos do |t|
      t.string :model
      t.references :marka_auto, foreign_key: true
      t.timestamps
    end
  end
end
