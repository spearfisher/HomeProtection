class AddSecretToRaspberries < ActiveRecord::Migration
  def change
    add_column :raspberries, :encrypted_secret, :string
    add_column :raspberries, :encrypted_secret_iv, :string
  end
end
