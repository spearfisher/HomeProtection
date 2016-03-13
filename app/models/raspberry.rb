class Raspberry < ActiveRecord::Base
  belongs_to :user
  serialize :settings
  validates :serial, uniqueness: true
  validates :address, :port, :serial, :version, presence: true
end
