shared_context "Fill new object details" do |place_name,city_name,postal_code,street_name,house_number,alternative_address|
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

shared_context "Choose object category" do |category,tag_text|
  it "clicks \"Kupovina\" category and enters: #{tag_text} in tag field" do
    @form.choose_category(category)
    @form.fill_tag(tag_text)
    expect(@form.finds_tag?(tag_text)).to eq true
  end
end

shared_context "Click tag text and add working hours" do |tag_text,invalid|
  it "clicks #{tag_text} from dropdown menu and adds working hours" do
    @form.click_tag_text(tag_text)
    if (invalid)
      @form.fill_working_hours("kl;","/4")
      expect(@form.whours_error_appears?).to eq true
      @form.remove_whours_error
    end
    @form.click_saturday_bttn
    @form.fill_working_hours("09:00","22:00")
    @form.click_sunday_bttn
    @form.fill_working_hours("11:00","20:00")
    @form.new_scroll("//input[@id=\"poi_phone\"]","down")
    expect(@form.finds_working_hours_info?).to eq true
  end
end

shared_context "Enter additional place info" do |validation,telephone_number,mobile_number,fax_number,website_url,facebook_url,instagram_url,wikipedia_url,youtube_url,email_address,twitter_url,forsquare_url,tripadvisor_url,instagram_hashtag,wifi_password,wifi_name,place_comment|
  it "enters telephone number, add social media links, Wi-Fi info, credit cards, picture, comment and clicks \"Kreiraj\" button" do
    @form.fill_phone_number("telephone",telephone_number)
    @form.fill_phone_number("mobile",mobile_number)
    @form.fill_phone_number("fax",fax_number)
    @form.fill_link("web",website_url)
    @form.fill_link("facebook",facebook_url)
    @form.fill_link("instagram",instagram_url)
    @form.fill_link("wikipedia",wikipedia_url)
    @form.fill_link("youtube",youtube_url)
    @form.fill_link("email",email_address)
    @form.fill_link("twitter",twitter_url)
    @form.fill_link("foursquare",forsquare_url)
    @form.fill_link("tripadvisor",tripadvisor_url)
    @form.fill_link("hashtag",instagram_hashtag)
    @form.fill_wifi_info(wifi_password,wifi_name)
    @form.fill_credit_cards_info
    @form.upload_picture
    @form.fill_comment(place_comment)
    @form.click_create_cancel("create")
    if (validation)
      expect(@form.error_message_appears?("Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo")).to eq true
    else
      @form.click_create_cancel("cancel")
      @navigation.fill_in_searchbox("Bingo Plus - Alta")
      @navigation.click_on_dropdown_item
      expect(@pane.finds_item?).to eq true
    end
  end
end
