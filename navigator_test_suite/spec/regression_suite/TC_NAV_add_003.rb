require './spec_helper'
require 'shared_context/open_place_form_sc'
require 'shared_context/fill_place_form_sc'


place_name = "Bingo Plus – Alta"
city_name = "Sarajevo"
postal_code = "71000"
street_name = "Franca Lehara"
house_number = "2"
alternative_address = "u sklopu Alta Shopping centra na  -1 spratu"
category = "7"
tag_text = "SUPER MARKET"
working_hours = ["09:00","22:00"]
telephone_number = "hjkl"
mobile_number = "06145"
fax_number = "080-//;"
website_url = "https:"
facebook_url = "jkllllmnbvghjk"
instagram_url = "00000"
wikipedia_url = "///../l;;."
youtube_url = "none"
email_address = "1243456"
twitter_url = " "
forsquare_url = ",,,,23"
tripadvisor_url = "l;.,;"
instagram_hashtag = "#NaPravomMjestu"
wifi_password = "bingo12345"
wifi_name = "AltaShoppingCenter"
picture = "bingo.jpg"
place_comment = "Slogan Binga je \"Kralj dobrih cijena!\""

#This test script includes more test cases. It enters invalid phone numbers, weblinks and working hours.

 describe "NEGATIVE TEST CASE: Add new full invalid data place" do

   before(:all) do
     @navigation = @homepage.get_main.get_navigation
     @form = @homepage.get_main.get_new_object_form
   end

   include_context "Open add new object form"
   include_context "Fill new object details",place_name,city_name,postal_code,street_name,house_number,alternative_address
   include_context "Choose object category",category,tag_text
   include_context "Click tag text and add working hours",tag_text,true,working_hours
   include_context "Enter additional place info",true,telephone_number,mobile_number,fax_number,website_url,facebook_url,instagram_url,wikipedia_url,youtube_url,email_address,twitter_url,forsquare_url,tripadvisor_url,instagram_hashtag,wifi_password,wifi_name,picture,place_comment

   context "Check if the social networks url text fields and telephone number fields have been validated" do
     it "checks if all social media links fields and telephone fields have red borders" do
       @form.scroll_to_element("//input[@id=\"poi_web\"]","up")
       expect(@form.check_link_field("web")).to eq true
       expect(@form.check_link_field("facebook")).to eq true
       expect(@form.check_link_field("instagram")).to eq true
       expect(@form.check_link_field("wikipedia")).to eq true
       expect(@form.check_link_field("youtube")).to eq true
       expect(@form.check_link_field("email")).to eq true
       expect(@form.check_link_field("foursquare")).to eq true
       expect(@form.check_link_field("tripadvisor")).to eq true
       expect(@form.check_numbers_fields("telephone")).to eq true
       expect(@form.check_numbers_fields("mobile")).to eq true
       expect(@form.check_numbers_fields("fax")).to eq true
     end
   end
 end
