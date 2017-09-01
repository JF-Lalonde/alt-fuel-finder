class NrelService
  def self.find_stations(filter)
    response = Faraday.get "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_KEY']}&location=#{filter[:zip]}&fuel_type=ELEC,LPG&limit=10&radius=6.0"
    raw_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end
