class AddCategoryToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :category, :integer, null: false, default: 0
  end
end
