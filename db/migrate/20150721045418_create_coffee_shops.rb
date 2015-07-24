class CreateCoffeeShops < ActiveRecord::Migration
  def change
    create_table :coffee_shops do |t|
      t.string :name, null: false
      t.text :description
      t.string :site
      t.string :email
      t.timestamps null: false
    end

    add_index :coffee_shops, :name, unique: true
  end
end
