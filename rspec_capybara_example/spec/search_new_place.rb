require './spec_helper'

place_name = "Metropolis"
place_address = "Maršala Tita 21"
place_phone = "033 203 315"

describe "Search new place" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
    @sidebar = @homepage.get_main.get_sidebar
  end

  context "Enter place into the search bar and search" do
    it "finds searched place: #{place_name}" do
      @navigation.fill_in_searchbox(place_name)
      @navigation.click_on_searchbox
      expect(@sidebar.exists_with_item?(place_name)).to eq(true)
    end
  end

  context "Chose place found on sidebar and check main info" do
    it "verifies that all main info for place: #{place_name} exists" do
      @sidebar.click_on_sidebar_item(place_name)
      expect(@sidebar.item_name_exists?(place_name)).to eq true
      expect(@sidebar.item_address_exists?(place_address)).to eq true
      expect(@sidebar.item_phone_exists?(place_phone)).to eq true
    end
  end
end