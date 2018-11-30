require './spec_helper'


place_name = "Gradska vijećnica"
place_category = "atrakcije"
place_address = "Obala Kulina bana"

describe "Search new place" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
    @sidebar = @homepage.get_main.get_sidebar
    @pane = @homepage.get_main.get_marker_pane
  end

  context "Enter place into the search bar and click on item from the dropdown menu" do
    it "finds searched place: #{place_name} and shows on sidebar" do
      @navigation.fill_in_searchbox(place_name)
      @navigation.click_on_dropdown_item
      expect(@sidebar.item_name_exists?(place_name)).to eq true
    end
  end

  context "Check main info on sidebar" do
    it "checks sidebar main info for place : #{place_name}" do
      expect(@sidebar.item_category_exists?(place_category)).to eq true
      expect(@sidebar.item_address_exists?(place_address)).to eq true
      expect(@sidebar.item_rating_exists?).to eq true
      expect(@sidebar.item_hours_exist?).to eq true
      expect(@sidebar.item_description_exists?("Opis objekta")).to eq true
    end
  end

  context "Check if place has been located on map and if message box pops up with main info" do
    it "finds place: #{place_name} on map and checks pop up message main info" do
      expect(@pane.finds_item?).to eq true
      expect(@pane.message_pops_up?).to eq true
      expect(@pane.item_name_exists?(place_name)).to eq true
      expect(@pane.item_address_exists?(place_address)).to eq true
      expect(@pane.item_working_hours_exist?).to eq true
    end
  end
end
