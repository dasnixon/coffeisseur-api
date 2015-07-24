class CreateCoffeeShopLocations < ActiveRecord::Migration
  def change
    create_table :coffee_shop_locations do |t|
      t.string :phone_number
      t.string :phone_country_code
      t.string :unit
      t.string :building
      t.string :street
      t.string :city
      t.string :region
      t.string :country
      t.string :address_code
      t.references :coffee_shop, index: true
      t.timestamps null: false
    end
  end
end
