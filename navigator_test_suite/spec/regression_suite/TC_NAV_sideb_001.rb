require './spec_helper'


describe "POSITIVE TEST CASE: Choose a sidebar item and click on it" do
  before(:all) do
    @sidebar = @homepage.get_main.get_sidebar
    @pane = @homepage.get_main.get_marker_pane
  end

  context "Click on an item from sidebar" do
    it "Clicks on \"SMOKE FREE PUBLIC PLACES\" from sidebar and checks sidebar content" do
      @sidebar.click_sidebar_item("SMOKE-FREE PUBLIC PLACES")
      expect(@sidebar.contains_menu_list).to eq true
    end
  end

  context "Check if smoke-free public places are shown on map" do
    it "Checks if smoke-free public places are shown on map" do
      expect(@pane.sf_places_shown_on_map?).to eq true
    end
  end

  context "Click on an item from sidebar" do
    it "Clicks on: \"Sushi San\" from sidebar and checks sidebar content" do
      @sidebar.click_on_sushi_item("Sushi San")
      expect(@sidebar.item_name_exists?("Sushi San")).to eq true
      expect(@sidebar.item_category_exists?("hrana")).to eq true
      expect(@sidebar.item_address_exists?("Muse Ćazima Ćatića 33")).to eq true
      expect(@sidebar.item_phone_number_exists?("033 833 034")).to eq true
      expect(@sidebar.item_mobile_number_exists?("062 672 782")).to eq true
      expect(@sidebar.item_description_exists?("Opis objekta")).to eq true
      expect(@sidebar.item_hours_exist?).to eq true
      expect(@sidebar.item_weblink_exists?("http://www.sarajevosushi.com/")).to eq true
    end
  end

  context "Check if place has been located on map and if message box pops up with main info" do
      it "finds place: \"Sushi San\" on map and checks pop up message main info" do
        expect(@pane.finds_item?).to eq true
        expect(@pane.message_pops_up?).to eq true
        expect(@pane.item_name_exists?("Sushi San")).to eq true
        expect(@pane.item_address_exists?("Muse Ćazima Ćatića 33")).to eq true
        expect(@pane.item_working_hours_exist?).to eq true
        expect(@pane.item_phone_number_exists?("033 833 034")).to eq true
        expect(@pane.item_weblink_exists?("http://www.sarajevosushi.com/")).to eq true
      end
    end
end
