require 'rails_helper'

feature "User enters zipcode" do
  scenario "and views corresponding stations" do
    visit "/"
    fill_in "Search", with: "80203"
    click_on "Locate"

    expect(current_path).to eq("/search")
    expect(params).to_not be_nil
    expect(page).to have_content("Station content")
    expect(stations.count).to eq(10)
    expect(station.type).to eq("Electric" || "Propane")
    expect(page).to have_content(station.name)
    expect(page).to have_content(station.address)
    expect(page).to have_content(station.fuel_types)
    expect(page).to have_content(station.distance)
    expect(page).to have_content(station.access_time)
  end
end
