class AddRateToValutes < ActiveRecord::Migration[7.0]
  def change
    add_column :valutes, :rate, :float
  end
end
