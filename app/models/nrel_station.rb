class NrelStation
  attr_reader :name, :fuel_type, :distance, :access_times, :address

  def initialize(attrs = {})
    @name = attrs[:station_name]
    @fuel_type = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end

  def self.search(filter)
    raw_stations = NrelService.find_stations(filter)

    raw_stations.map do |raw_station|
      NrelStation.new(raw_station)
    end
  end
end
