class Trip < ActiveRecord::Base
  belongs_to :walker
  has_many :turns

  CURRENT_COORDINATES = "https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GOOGLE_KEY']}"

  def self.get_current_location
    location_hash = HTTParty.post(CURRENT_COORDINATES, verify: false)
    latitude = location_hash["location"]["lat"]
    longitude = location_hash["location"]["lng"]
    return latitude, longitude
  end

end
