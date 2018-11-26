require './spec_helper'
require './shared_context'

street_name = "Grbavička"

describe "Search street name" do
  include_context "shared methods"

  context "Enter street into the search bar and click on item from the dropdown menu" do
    it "finds searched street: #{street_name} and shows on sidebar" do
      navigation_search(street_name)
      expect(@sidebar.exists_with_item?(street_name)).to eq true
    end
  end

  context "Click on street name from sidebar main and check if the map zoomed in" do
    it "clicks on item: #{street_name} and zooms in map" do
     @sidebar.click_on_sidebar_item(street_name)
     expect(@pane.finds_item?).to eq true
    end
  end
end
