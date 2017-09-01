require 'rails_helper'

#feature "User enters zipcode" do
  #scenario "and views corresponding stations" do
    #visit "/"
    #fill_in "Searching", with: "80203"
    #click_on "Locate"

    #expect(current_path).to eq("/search")
    #expect(params).to_not be_nil
    #expect(page).to have_content("Station content")
    #expect(stations.count).to eq(10)
    #expect(station.type).to eq("Electric" || "Propane")
    #expect(page).to have_content(station.name)
    #expect(page).to have_content(station.address)
    #expect(page).to have_content(station.fuel_types)
    #expect(page).to have_content(station.distance)
    #expect(page).to have_content(station.access_time)
  #end
feature "User searches for stations by zip" do
  scenario "with a valid zip" do
    visit "/"
    fill_in "q", with: "80203"
    click_on "Locate"

    expect(current_path).to eq("/search")
    #Testing for closest stations makes more sense at unit level.
    #When searching for 10 stations, you can make the assumption that 10 css elements will be present (BDD)
    expect(page).to have_css(".station", count: 10)
    #Test for fuel types limited to ELEC and LPG at the unit level.
    within(".station", match: :first) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_type")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access_time")
    end
  end
end
