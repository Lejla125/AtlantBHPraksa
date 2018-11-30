require './spec_helper'


place_name = "Bingo Plus – Alta"
city_name = "Sarajevo"
postal_code = "71000"
street_name = "Franca Lehara"
house_number = "2"
alternative_address = "u sklopu Alta Shopping centra na  -1 spratu"
category = "7"
tag_text ="SUPER MARKET"
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
place_comment = "Slogan Binga je \"Kralj dobrih cijena!\""

#This test script includes more test cases. It enters invalid phone numbers, weblinks and working hours.

 describe "NEGATIVE TEST CASE: Add new full invalid data place" do

   before(:all) do
     @navigation = @homepage.get_main.get_navigation
     @form = @homepage.get_main.get_new_object_form
   end

   include_context "Open add new object form" do
   end

   include_context "Fill new object form",place_name,city_name,postal_code,street_name,house_number,alternative_address,category,tag_text do
   end

   context "Click tag text and add working hours" do
     it "clicks #{tag_text} from dropdown menu and adds working hours" do
       @form.click_tag_text(tag_text)
       @form.scroll("//textarea[@id=\"poi_description\"]")
       @form.fill_working_hours("kl;","/4")
       expect(@form.whours_error_appears?).to eq true
       @form.remove_whours_error
      expect(fill_new_object_form_whours(tag_text)).to eq true
     end
   end

   context "Enter additional place info" do
     it "enters telephone number, add social media links, Wi-Fi info, credit cards, picture, comment and clicks \"Kreiraj\" button" do
       fill_form_socialnet(true,telephone_number,mobile_number,fax_number,website_url,facebook_url,instagram_url,wikipedia_url,youtube_url,email_address,twitter_url,forsquare_url,tripadvisor_url,instagram_hashtag,wifi_password,wifi_name,place_comment)
       expect(@form.error_message_appears?("Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo")).to eq true
     end
   end
 end
