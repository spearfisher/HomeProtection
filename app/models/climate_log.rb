class ClimateLog < ActiveRecord::Base
  belongs_to :climate_sensor
  scope :today, -> { where('datetime > ?', Date.today) }
end
