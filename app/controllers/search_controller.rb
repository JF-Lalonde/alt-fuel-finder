class SearchController < ApplicationController
  def index
    filter = { zip: params[:q] }
    raw_stations = NrelService.find_stations(filter)

    @stations = raw_stations.map do |raw_station|
      NrelStation.new(raw_station)
    end

    @stations = NrelStation.search(filter)
  end
end


