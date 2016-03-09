class AddNameToRaspberries < ActiveRecord::Migration
  def change
    add_column :raspberries, :name, :string
  end
end
