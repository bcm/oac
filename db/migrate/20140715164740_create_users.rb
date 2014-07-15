class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.uuid :uuid, null: false
      t.string :email, null: false
      t.timestamps
    end
    execute "CREATE UNIQUE INDEX users_email_lower_index ON users(LOWER(email))"
  end
end
