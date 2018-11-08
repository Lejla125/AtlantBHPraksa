require './spec_helper'

street_name = "Grbavička"

describe "Search street name" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
    @sidebar = @homepage.get_main.get_sidebar
    @dropdown = @homepage.get_main.get_dropdown
    @pane = @homepage.get_main.get_marker_pane
  end

  context "Enter street into the search bar and click on item from the dropdown menu" do
    it "finds searched street: #{street_name} and shows on sidebar" do
      @navigation.fill_in_searchbox(street_name)
      @dropdown.click_on_dropdown_item
      expect(@sidebar.exists_with_item?).to eq true
    end
  end
  
  context "Click on street name from sidebar main and check if the map zoomed in" do
    it "clicks on item: #{street_name} and zooms in map" do
     @sidebar.click_on_sidebar_item
     expect(@pane.finds_item?).to eq true
    end
  end
end
