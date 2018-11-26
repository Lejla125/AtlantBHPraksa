require './spec_helper'
require './shared_context'

place_name = "Gradska vijećnica"
place_category = "atrakcije"
place_address = "Obala Kulina bana"

describe "Search new place" do
  include_context "shared methods"

  context "Enter place into the search bar and click on item from the dropdown menu" do
    it "finds searched place: #{place_name} and shows on sidebar" do
      navigation_search(place_name)
      expect(@sidebar.item_name_exists?(place_name)).to eq true
    end
  end
  context "Check main info on sidebar" do
    it "checks sidebar main info for place : #{place_name}" do
      expect(sidebar_info_check(place_category,place_address)).to eq true
      expect(@sidebar.item_hours_exist?).to eq true
      expect(@sidebar.item_description_exists?("Opis objekta")).to eq true
    end
  end
  context "Check if place has been located on map and if message box pops up with main info" do
      it "finds place: #{place_name} on map and checks pop up message main info" do
        expect(pane_info_check(place_name,place_address)).to eq true
        expect(@pane.item_working_hours_exist?).to eq true
      end
    end
end
