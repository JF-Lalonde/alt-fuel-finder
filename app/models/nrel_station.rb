class NrelStation
  attr_reader :name, :fuel_type, :distance, :access_times, :address

  def initialize(attrs = {})
    @name = attrs[:station_name]
    @fuel_type = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end
end
