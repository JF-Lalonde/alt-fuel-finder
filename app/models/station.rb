class Station < ActiveRecord::Base
  def initialize(response)
    response[:fuel_stations].each do |station|
      @name = station["station_name"]
      @address = station["street_address"]
      @fuel_types = station["fuel_type_code"]
      @distance = station["id"] #Need to go back and create a distance-finding method
      @access_time = station["access_days_time"]
  end
end
