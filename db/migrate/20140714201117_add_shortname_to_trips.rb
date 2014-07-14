class AddShortnameToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :shortname, :string, null: false
  end
end
