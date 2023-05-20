class CreateTypeTransmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :type_transmissions do |t|
      t.string :name
      t.timestamps
    end
  end
end
