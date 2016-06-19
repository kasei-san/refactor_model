class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :zipcode
      t.integer :prefecture_code
      t.integer :city_code
      t.string :address

      t.timestamps null: false
    end
  end
end
