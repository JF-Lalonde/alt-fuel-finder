require 'rails_helper'

feature "User enters zipcode" do
  scenario "and views corresponding stations" do
    visit "/"
    fill_in "Search", with: "80203"
    click_on "Locate"

    expect(current_path).to eq("/search")
    expect(params).to_not be_nil
    expect(page).to have_content("Station content")
  end
end
