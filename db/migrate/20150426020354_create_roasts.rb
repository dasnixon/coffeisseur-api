class CreateRoasts < ActiveRecord::Migration
  def change
    create_table :roasts do |t|
      t.string :degree_of_roast, null: false
      t.text :description
      t.string :roasted_with
      t.integer :time, null: false
      t.integer :first_crack_at
      t.integer :second_crack_at
      t.boolean :favorite, default: false
      t.belongs_to :bean, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
