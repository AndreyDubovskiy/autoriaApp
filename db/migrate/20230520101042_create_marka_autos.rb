class CreateMarkaAutos < ActiveRecord::Migration[7.0]
  def change
    create_table :marka_autos do |t|
      t.string :name
      t.timestamps
    end
  end
end
