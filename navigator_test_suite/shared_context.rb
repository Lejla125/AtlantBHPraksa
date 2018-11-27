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
    @form = @homepage.get_main.get_new_object_form
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

  def fill_new_object_form(place_name,city_name,postal_code,street_name,house_number,alternative_address)
    @form.fill_object_name(place_name)
    @form.fill_city_name(city_name)
    @form.fill_zip_code(postal_code)
    @form.fill_street_name(street_name)
    @form.fill_house_number(house_number)
    @form.fill_alt_street(alternative_address)
    @form.fill_description("short description text")
    @form.click_category_button
    true if @form.category_list_appears?
  end

  def fill_new_object_form_tag(category,tag_text)
    @form.choose_category(category)
    @form.fill_tag(tag_text)
    true if @form.finds_tag?(tag_text)
  end

  def fill_form_socialnet(telephone_number,mobile_number,fax_number,website_url,facebook_url,instagram_url,wikipedia_url,youtube_url,email_address,twitter_url,forsquare_url,tripadvisor_url,instagram_hashtag,wifi_password,wifi_name,place_comment)
    @form.scroll("//button[@class=\"btn btnAddWorkingHours\"]")
    @form.fill_telephone_number(telephone_number)
    @form.fill_mobile_number(mobile_number)
    @form.fill_fax_number(fax_number)
    @form.fill_weblink(website_url)
    @form.fill_fblink(facebook_url)
    @form.fill_iglink(instagram_url)
    @form.fill_wikilink(wikipedia_url)
    @form.fill_ytlink(youtube_url)
    @form.fill_email(email_address)
    @form.fill_twitterlink(twitter_url)
    @form.fill_fsquarelink(forsquare_url)
    @form.fill_tripadvisorlink(tripadvisor_url)
    @form.fill_ighashtag(instagram_hashtag)
    @form.scroll("//input[@id=\"poi_phone\"]")
    @form.fill_wifi_info(wifi_password,wifi_name)
    @form.scroll("//input[@id=\"poi_has_wifi\"]")
    @form.fill_credit_cards_info
    @form.upload_picture
    @form.fill_comment(place_comment)
    @form.click_create
  end

RSpec.configure do |rspec|
  rspec.include_context "shared methods", :include_shared => true
end
