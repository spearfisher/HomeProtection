# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def date(n)
  Time.now - 1.month + n * 2.hour
end

def temp
  rand(19.5..24.2).round(2)
end

def rh
  rand(37.4..70.2).round(2)
end

# Seeding 1 month climate logs for each sensor in database
ClimateSensor.find_each do |sensor|
  372.times do |n|
    p ClimateLog.create(climate_sensor_id: sensor.id, datetime: date(n), temp: temp, humidity: rh)
  end
end
