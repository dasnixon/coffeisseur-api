class CreateRoasts < ActiveRecord::Migration
  def change
    create_table :roasts do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price_per_lb
      t.string :origin
      t.string :process
      t.references :roaster, index: true
      t.timestamps null: false
    end
  end
end
