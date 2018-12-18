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
tag_text ="SUPER MARKET"
working_hours = ["09:00","22:00"]
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
picture = "bingo.jpg"
place_comment = "Slogan Binga je \"Kralj dobrih cijena!\""

 describe "POSITIVE TEST CASE: Add new full valid data place" do

   before(:all) do
     @navigation = @homepage.get_main.get_navigation
     @pane = @homepage.get_main.get_marker_pane
     @form = @homepage.get_main.get_new_object_form
   end

   include_context "Open add new object form"
   include_context "Fill new object details",place_name,city_name,postal_code,street_name,house_number,alternative_address,category
   include_context "Choose object category",category,tag_text
   include_context "Click tag text and add working hours",tag_text,false,working_hours
   include_context "Enter additional place info",false,telephone_number,mobile_number,fax_number,website_url,facebook_url,instagram_url,wikipedia_url,youtube_url,email_address,twitter_url,forsquare_url,tripadvisor_url,instagram_hashtag,wifi_password,wifi_name,picture,place_comment
 end
