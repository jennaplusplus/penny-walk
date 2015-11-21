class Trip < ActiveRecord::Base
  belongs_to :walker
  has_many :turns

  CURRENT_COORDINATES = "https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GOOGLE_KEY']}"

  def get_current_location
    location_hash = HTTParty.post(CURRENT_COORDINATES, verify: false)
    start_latitude = location_hash["location"]["lat"]
    start_longitude = location_hash["location"]["lng"]
    return start_latitude, start_longitude
  end

  def get_directions
    # retrieve start lat/long for current trip
    # retrieve end lat/long for current trip
    # maybe not a method after all
  end

end
