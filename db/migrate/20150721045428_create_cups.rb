class CreateCups < ActiveRecord::Migration
  def change
    create_table :cups do |t|
      t.string :name, null: false
      t.text :description
      t.string :brew_process
      t.integer :rating
      t.timestamps null: false
    end
  end
end
