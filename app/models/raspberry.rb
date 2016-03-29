class Raspberry < ActiveRecord::Base
  attr_encrypted :secret, key: Rails.application.secrets.serial_key
  belongs_to :user
  serialize :settings
  validates :serial, uniqueness: true
  validates :address, :port, :serial, :revision, presence: true

  def url
    "http://#{address}:#{port}"
  end
end
