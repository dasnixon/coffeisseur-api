class CreateCoffeeShopLocations < ActiveRecord::Migration
  def change
    create_table :coffee_shop_locations do |t|
      t.string :unit
      t.string :building
      t.string :street
      t.string :city
      t.string :region
      t.string :country
      t.string :address_code
      t.timestamps null: false
    end
  end
end
