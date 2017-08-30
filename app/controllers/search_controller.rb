class SearchController < ApplicationController
  def index
    conn = Faraday.get "https://api.data.gov/nrel/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&zip=#{params[:q]}&api_key=#{ENV['NREL_KEY']}"
    @response = JSON.parse(conn.body)
  end
end
