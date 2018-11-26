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

   before(:all) do
     @form = @homepage.get_main.get_new_object_form
   end

   context "Open add new object form" do
     it "clicks on \"Kreiraj objekat\" item and checks if empty form appears" do
       expect(open_new_object_form).to eq true
     end
   end

   context "Enter object's details and click \"Odaberite kategoriju\" button" do
     it "enters object main info and clicks category button" do
       @form.fill_object_name(place_name)
       @form.fill_city_name(city_name)
       @form.fill_zip_code(postal_code)
       @form.fill_street_name(street_name)
       @form.fill_house_number(house_number)
       @form.fill_alt_street(alternative_address)
       @form.fill_description("short description text")
       @form.click_category_button
       expect(@form.category_list_appears?).to eq true
     end
   end

   context "Click object's category and enter tag text" do
     it "clicks \"Kupovina\" category and enters: #{tag_text} in tag field" do
       @form.choose_category("7")
       @form.fill_tag(tag_text)
       expect(@form.finds_tag?(tag_text)).to eq true
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
       navigation_search("Bingo Plus - Alta")
       expect(@pane.finds_item?).to eq true
     end
   end
 end
