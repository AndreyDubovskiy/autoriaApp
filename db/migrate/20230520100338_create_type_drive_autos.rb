class CreateTypeDriveAutos < ActiveRecord::Migration[7.0]
  def change
    create_table :type_drive_autos do |t|
      t.string :name
      t.timestamps
    end
  end
end
