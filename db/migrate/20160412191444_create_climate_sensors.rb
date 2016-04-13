class CreateClimateSensors < ActiveRecord::Migration
  def change
    create_table :climate_sensors do |t|
      t.references :raspberry, index: true, foreign_key: true
      t.string :name
      t.string :model
      t.integer :port_number

      t.timestamps null: false
    end
  end
end
