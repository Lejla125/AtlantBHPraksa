require 'yaml'
require 'capybara/rspec'
require "chromedriver/helper"
require 'selenium-webdriver'
require './lib/homepage.rb'
require './lib/main.rb'
Dir["./lib/*.rb"].each {|file| require file }

RSpec.configure do |rspec|
  # This config option will be enabled by default on RSpec 4,
  # but for reasons of backwards compatibility, you have to
  # set it on RSpec 3.
  #
  # It causes the host group and examples to inherit metadata
  # from the shared context.
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context "shared methods", :shared_context => :metadata do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
    @sidebar = @homepage.get_main.get_sidebar
    @pane = @homepage.get_main.get_marker_pane
  end

  def navigation_search(item_name)
    @navigation.fill_in_searchbox(item_name)
    @navigation.click_on_dropdown_item
  end

  def sidebar_info_check(place_category,place_address)
    if (@sidebar.item_category_exists?(place_category) && @sidebar.item_address_exists?(place_address) && @sidebar.item_rating_exists?)
      return true
    else
      return false
    end
  end

  def pane_info_check(place_name,street_address)
    if(@pane.finds_item? && @pane.message_pops_up? && @pane.item_name_exists?(place_name) && @pane.item_address_exists?(street_address))
      return true
    else
      return false
    end
  end

  def open_new_object_form
    @navigation.click_add_new_object_item
    true if @navigation.finds_new_object_form?
  end
end

RSpec.configure do |rspec|
  rspec.include_context "shared methods", :include_shared => true
end
