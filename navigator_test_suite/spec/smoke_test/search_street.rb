require './spec_helper'


street_name = "Grbavička"

describe "Search street name" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
    @sidebar = @homepage.get_main.get_sidebar
    @pane = @homepage.get_main.get_marker_pane
  end

  include_context "Fill search bar and check sidebar",street_name 

  context "Click on street name from sidebar main and check if the map zoomed in" do
    it "clicks on item: #{street_name} and zooms in map" do
     @sidebar.click_on_sidebar_item(street_name)
     expect(@pane.finds_item?).to eq true
    end
  end
end
