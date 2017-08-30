class SearchController < ApplicationController
  def index
    @conn = Faraday.get "https://api.data.gov/nrel/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&zip=#{params[:q]}&limit=10&api_key=#{ENV['NREL_KEY']}"
    byebug
  end
end
