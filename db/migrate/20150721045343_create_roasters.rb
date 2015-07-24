class CreateRoasters < ActiveRecord::Migration
  def change
    create_table :roasters do |t|
      t.string :name
      t.datetime :founded
      t.text :description
      t.string :site
      t.timestamps null: false
    end
  end
end
