require './spec_helper'
require './shared_context'

street_name = "Marka Marulića"

describe "POSITIVE TEST CASE: Enter a street name and choose a place on that street" do
  include_context "shared methods"

  context "Enter street into the search bar and click on item from the dropdown menu" do
    it "finds searched street: #{street_name} and shows on sidebar" do
      navigation_search(street_name)
      expect(@sidebar.exists_with_item?(street_name)).to eq true
    end
  end

  context "Click on an item from sidebar" do
    it "clicks on: \"Casa\" item and checks main info for it" do
      @sidebar.choose_sidebar_place("Casa")
      expect(@sidebar.item_name_exists?("Casa")).to eq true
      expect(sidebar_info_check("italijanski restoran",street_name)).to eq true
    end
  end

  context "Check if place has been located on map and if message box pops up with main info" do
      it "finds place: \"Casa\" on map and checks pop up message main info" do
        expect(pane_info_check("Casa",street_name)).to eq true
      end
    end
end
