class AddAdvertisementToAutos < ActiveRecord::Migration[7.0]
  def change
    add_reference :autos, :advertisement, null: false, foreign_key: true
  end
end
