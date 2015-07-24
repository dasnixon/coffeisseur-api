class CreateJoinTableCoffeeShopRoast < ActiveRecord::Migration
  def change
    create_join_table :coffee_shops, :roasts do |t|
      t.index [:coffee_shop_id, :roast_id], unique: true
    end
  end
end
