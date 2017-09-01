require 'rails_helper'

RSpec.describe NrelStation, type: :model do
  it "successfully initializes with valid attributes" do
    valid_attrs = {access_days_time: "24 hours daily",
                   fuel_type_code: "ELEC",
                   station_name: "UDR",
                   city: "Denver",
                   state: "CO"
    }
    station = NrelStation.new(valid_attrs)

    expect(station.name).to eq("UDR")
    expect(station.fuel_type).to eq("ELEC")
  end
end
