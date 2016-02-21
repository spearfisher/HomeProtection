class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :uid
      t.string :token
      t.string :refresh_token

      t.timestamps null: false
    end
  end
end
