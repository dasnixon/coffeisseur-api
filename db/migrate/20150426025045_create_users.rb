class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: true
      t.boolean :roaster, default: false
      t.text :about
      t.string :username
      t.string :favorite_roaster
      t.string :password_digest
      t.string :role, default: 'non-admin', index: true
      t.timestamps null: false
    end
  end
end
