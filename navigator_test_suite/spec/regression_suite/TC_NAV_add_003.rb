require './spec_helper'
require './shared_context'


place_name = "Bingo Plus – Alta"
city_name = "Sarajevo"
postal_code = "71000"
street_name = "Franca Lehara"
house_number = "2"
alternative_address = "u sklopu Alta Shopping centra na  -1 spratu"
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

 describe "NEGATIVE TEST CASE: Add new full invalid data place" do
   include_context "shared methods"

   context "Open add new object form" do
     it "clicks on \"Kreiraj objekat\" item and checks if empty form appears" do
       expect(open_new_object_form).to eq true
     end
   end

   context "Enter object's details and click \"Odaberite kategoriju\" button" do
     it "enters object main info and clicks category button" do
      expect(fill_new_object_form(place_name,city_name,postal_code,street_name,house_number,alternative_address)).to eq true
     end
   end

   context "Click object's category and enter tag text" do
     it "clicks \"Kupovina\" category and enters: #{tag_text} in tag field" do
       expect(fill_new_object_form_tag("7",tag_text)).to eq true
     end
   end

   context "Click tag text and add working hours" do
     it "clicks #{tag_text} from dropdown menu and adds working hours" do
       @form.click_tag_text(tag_text)
       @form.scroll("//textarea[@id=\"poi_description\"]")
       @form.click_saturday_bttn
       @form.fill_working_hours("09:00","22:00")
       @form.click_sunday_bttn
       @form.fill_working_hours("11:00","20:00")
       expect(@form.finds_working_hours_info?).to eq true
     end
   end

   context "Enter additional place info" do
     it "enters telephone number, add social media links, Wi-Fi info, credit cards, picture, comment and clicks \"Kreiraj\" button" do
       fill_form_socialnet(telephone_number,mobile_number,fax_number,website_url,facebook_url,instagram_url,wikipedia_url,youtube_url,email_address,twitter_url,forsquare_url,tripadvisor_url,instagram_hashtag,wifi_password,wifi_name,place_comment)
       expect(@form.error_message_appears?("Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo")).to eq true
     end
   end
 end
