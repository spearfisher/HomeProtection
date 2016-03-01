class CreateRaspberries < ActiveRecord::Migration
  def change
    create_table :raspberries do |t|
      t.references :user, index: true, foreign_key: true
      t.string :address
      t.string :port
      t.string :version
      t.string :serial
      t.text :settings

      t.timestamps null: false
    end
  end
end
