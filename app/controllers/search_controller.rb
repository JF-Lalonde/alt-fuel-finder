class SearchController < ApplicationController
  #def index
    ##conn = Faraday.get "https://api.data.gov/nrel/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&zip=#{params[:q]}&api_key=#{ENV['NREL_KEY']}"
    ##This url is not the correct one to return the nearest stations.
    #response = JSON.parse(conn.body, symbolize_names: true)
    ##Symbolize "names" not "keys" because at this point it's a JSON object, and in JS it's name-value pairs, not key-value.
    #response[:fuel_stations].each do |station|
      #Station.new(station)
    #end
    #@stations = Station.all
  #end
  def index
    response = Faraday.get "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_KEY']}&location=#{params[:q]}&fuel_type=ELEC,LPG&limit=10&radius=6.0"
    raw_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations = raw_stations.map do |raw_station|
      NrelStation.new(raw_station)
    end
  end
end

class NrelStation
  attr_reader :name, :fuel_type, :distance, :access_times, :address

  def initialize(attrs = {})
    @name = attrs[:station_name]
    @fuel_type = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end
end
