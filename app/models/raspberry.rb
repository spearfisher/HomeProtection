class Raspberry < ActiveRecord::Base
  attr_encrypted :secret, key: Rails.application.secrets.serial_key
  belongs_to :user
  serialize :settings
  validates :serial, uniqueness: true
  validates :address, :port, :serial, :version, presence: true
end
