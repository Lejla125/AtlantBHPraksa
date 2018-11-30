require './spec_helper'

street_name = "Marka Marulića"

describe "POSITIVE TEST CASE: Enter a street name and choose a place on that street" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
    @sidebar = @homepage.get_main.get_sidebar
    @pane = @homepage.get_main.get_marker_pane
  end

    include_context "Fill search bar and check sidebar",street_name do
    end

    it "clicks on: \"Casa\" item and checks main info for it" do
      @sidebar.choose_sidebar_place("Casa")
      expect(@sidebar.item_name_exists?("Casa")).to eq true
      expect(@sidebar.item_category_exists?("italijanski restoran")).to eq true
      expect(@sidebar.item_address_exists?("Marka Marulića")).to eq true
      expect(@sidebar.item_rating_exists?).to eq true
    end

    it "finds place: \"Casa\" on map and checks pop up message main info" do
      expect(@pane.finds_item?).to eq true
      expect(@pane.message_pops_up?).to eq true
      expect(@pane.item_name_exists?("Casa")).to eq true
      expect(@pane.item_address_exists?(street_name)).to eq true
    end
end
