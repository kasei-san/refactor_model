class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.string :zipcode
      t.integer :prefecture_code
      t.integer :city_code
      t.string :address
      t.integer :user_id

      t.timestamps null: false
    end

    User.all.each do |user|
      Profile.create(
        user:            user,
        zipcode:         user.zipcode,
        prefecture_code: user.prefecture_code,
        city_code:       user.city_code,
        address:         user.address
      )
    end

    remove_column :users, :zipcode
    remove_column :users, :prefecture_code
    remove_column :users, :city_code
    remove_column :users, :address
  end

  def down
    add_column :users, :zipcode
    add_column :users, :prefecture_code
    add_column :users, :city_code
    add_column :users, :address

    Profile.each do |profile|
      profile.user.update(
        zipcode:         profile.zipcode,
        prefecture_code: profile.prefecture_code,
        city_code:       profile.city_code,
        address:         profile.address
      )
    end

    drop_table :profiles
  end
end
