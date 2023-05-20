class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :pobatkovi
      t.string :phone
      t.references :user_login, foreign_key: true
      t.references :status, foreign_key: true
      t.references :city, foreign_key: true
      t.timestamps
    end
  end
end
