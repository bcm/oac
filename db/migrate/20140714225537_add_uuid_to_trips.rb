class AddUuidToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :uuid, :uuid, null: false
  end
end
