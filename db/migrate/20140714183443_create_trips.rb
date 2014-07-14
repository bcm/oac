class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.date :starts_on, null: false
      t.date :ends_on, null: false
      t.timestamps
    end
  end
end
