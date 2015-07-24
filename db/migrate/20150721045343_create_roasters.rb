class CreateRoasters < ActiveRecord::Migration
  def change
    create_table :roasters do |t|
      t.string :name, null: false
      t.datetime :founded
      t.text :description
      t.string :site
      t.string :email
      t.string :phone
      t.string :phone_country_code
      t.timestamps null: false
    end

    add_index :roasters, :name, unique: true
  end
end
