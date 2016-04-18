class ClimateLog < ActiveRecord::Base
  belongs_to :climate_sensor
  scope :today, -> { where('datetime > ?', Date.today) }
  scope :last_week, -> { where('datetime > ?', 1.week.ago) }
  scope :last_month, -> { where('datetime > ?', 1.month.ago) }
end
