class NrelService
  def initialize
  end

  def find_stations(filter)
    conn = Faraday.new("https://developer.nrel.gov")
    filter = {location: filter[:zip]} #This still needs to be refactored in the model
    url = "/api/alt-fuel-stations/v1/nearest.json?"
    response = conn.get(url, default_params.merge(filter))
    raw_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def default_params
    {
      api_key: ENV['NREL_KEY'],
      fuel_type: "ELEC,LPG",
      limit: 10,
      radius: "6.0"
    }
  end

  def self.find_stations(filter)
    new.find_stations(filter)
  end
end
