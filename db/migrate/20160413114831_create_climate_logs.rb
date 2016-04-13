class CreateClimateLogs < ActiveRecord::Migration
  def change
    create_table :climate_logs do |t|
      t.references :climate_sensor, index: true, foreign_key: true
      t.datetime :datetime
      t.float :temp
      t.float :humidity

      t.timestamps null: false
    end
  end
end
