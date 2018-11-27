require './spec_helper'
require './shared_context'


place_name = "Bingo Plus – Alta"
city_name = "Sarajevo"
postal_code = "71000"
street_name = "Franca Lehara"
house_number = "2"
alternative_address = "u sklopu Alta Shopping centra na  -1 spratu"
tag_text ="SUPER MARKET"
telephone_number = "033256850"
mobile_number = "061455632"
fax_number = "080090822"
website_url = "https://alta.ba/shopping/bingo-plus/"
facebook_url = "https://www.facebook.com/altashopping/?__tn__=%2Cd%2CP-R&eid=ARAU1ykSWP813ddP_U0mksny6DVQOHO4qwk6J_0k86305lAtJV1v1Hi3jQDnFBiZP1FgCNVPBQuIpfne"
instagram_url = "https://www.instagram.com/altashoppingcenter/"
wikipedia_url = "https://bs.wikipedia.org/wiki/Bingo_"
youtube_url = "https://www.youtube.com/channel/UCw2vHFtUwQl2GwwWV7-ekqQ"
email_address = "marketing@confluence.ba"
twitter_url = "https://twitter.com/alta_center"
forsquare_url = "https://foursquare.com/v/alta-shopping-center/4d0cd70ef393224b28cc18ee/photos"
tripadvisor_url = "https://www.tripadvisor.com/Attraction_Review-g294450-d2272399-Reviews-Alta_Shopping_Center-Sarajevo_Sarajevo_Canton.html"
instagram_hashtag = "#NaPravomMjestu"
wifi_password = "bingo12345"
wifi_name = "AltaShoppingCenter"
place_comment = "Slogan Binga je \"Kralj dobrih cijena!\""

 describe "POSITIVE TEST CASE: Add new full data place" do
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
       @form.click_cancel
       navigation_search("Bingo Plus - Alta")
       expect(@pane.finds_item?).to eq true
     end
   end
 end