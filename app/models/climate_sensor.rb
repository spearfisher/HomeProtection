class ClimateSensor < ActiveRecord::Base
  belongs_to :raspberry
  has_many :climate_logs, dependent: :delete_all
  validates :port_number, uniqueness: true
end
