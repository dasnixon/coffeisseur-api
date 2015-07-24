class CreateCups < ActiveRecord::Migration
  def change
    create_table :cups do |t|
      t.string :name, null: false
      t.text :description
      t.string :brew_process
      t.integer :rating
      t.references :coffee_shop, index: true
      t.references :roast, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
