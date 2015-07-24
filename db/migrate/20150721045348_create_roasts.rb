class CreateRoasts < ActiveRecord::Migration
  def change
    create_table :roasts do |t|
      t.string :name
      t.text :description
      t.integer :price_per_lb
      t.string :origin
      t.string :process
      t.belongs_to :roaster
      t.timestamps null: false
    end
  end
end
