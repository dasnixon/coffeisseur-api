class RemoveAttributesUseCharacteristics < ActiveRecord::Migration
  def change
    remove_column :beans, :attributes, :text
    add_column :beans, :characteristics, :text
  end
end
