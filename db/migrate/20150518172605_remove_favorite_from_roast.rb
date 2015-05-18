class RemoveFavoriteFromRoast < ActiveRecord::Migration
  def change
    remove_column :roasts, :favorite, :boolean
  end
end
