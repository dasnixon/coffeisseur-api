class CreateBeans < ActiveRecord::Migration
  def change
    create_table :beans do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :characteristics
      t.string :degree_of_roast, null: false
      t.string :farm
      t.string :varietal
      t.string :processing
      t.string :grade
      t.string :appearance
      t.string :country, null: false
      t.string :region, null: false
      t.boolean :organic, default: false
      t.boolean :espresso, default: false
      t.timestamps null: false
    end
  end
end
