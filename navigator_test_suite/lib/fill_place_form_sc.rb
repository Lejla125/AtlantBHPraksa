RSpec.configure do |rspec|
  # This config option will be enabled by default on RSpec 4,
  # but for reasons of backwards compatibility, you have to
  # set it on RSpec 3.
  #
  # It causes the host group and examples to inherit metadata
  # from the shared context.
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context "Fill new object form" do |place_name,city_name,postal_code,street_name,house_number,alternative_address,category,tag_text|

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

  it "clicks \"Kupovina\" category and enters: #{tag_text} in tag field" do
    @form.choose_category(category)
    @form.fill_tag(tag_text)
    expect(@form.finds_tag?(tag_text)).to eq true
  end

  def fill_new_object_form_whours(tag_text)
    @form.click_saturday_bttn
    @form.fill_working_hours("09:00","22:00")
    @form.click_sunday_bttn
    @form.fill_working_hours("11:00","20:00")
    expect(@form.finds_working_hours_info?).to eq true
  end

  def fill_form_socialnet(validation,telephone_number,mobile_number,fax_number,website_url,facebook_url,instagram_url,wikipedia_url,youtube_url,email_address,twitter_url,forsquare_url,tripadvisor_url,instagram_hashtag,wifi_password,wifi_name,place_comment)
    @form.scroll("//button[@class=\"btn btnAddWorkingHours\"]")
    @form.fill_phone_number("telephone",telephone_number)
    @form.fill_phone_number("mobile",mobile_number)
    @form.fill_phone_number("fax",fax_number)
    @form.fill_link("web",website_url)
    if(validation)
      expect(@form.check_numbers_fields("telephone")).to eq true
      expect(@form.check_numbers_fields("mobile")).to eq true
      expect(@form.check_numbers_fields("fax")).to eq true
    end
    @form.fill_link("facebook",facebook_url)
    @form.fill_link("instagram",instagram_url)
    @form.fill_link("wikipedia",wikipedia_url)
    @form.fill_link("youtube",youtube_url)
    @form.fill_link("email",email_address)
    @form.fill_link("twitter",twitter_url)
    @form.fill_link("foursquare",forsquare_url)
    @form.fill_link("tripadvisor",tripadvisor_url)
    @form.fill_link("hashtag",instagram_hashtag)
    @form.scroll("//input[@id=\"poi_phone\"]")
    @form.fill_wifi_info(wifi_password,wifi_name)
    if (validation)
      expect(@form.check_link_field("web")).to eq true
      expect(@form.check_link_field("facebook")).to eq true
      expect(@form.check_link_field("instagram")).to eq true
      expect(@form.check_link_field("wikipedia")).to eq true
      expect(@form.check_link_field("youtube")).to eq true
      expect(@form.check_link_field("email")).to eq true
      expect(@form.check_link_field("foursquare")).to eq true
      expect(@form.check_link_field("tripadvisor")).to eq true
    end
    @form.scroll("//input[@id=\"poi_has_wifi\"]")
    @form.fill_credit_cards_info
    @form.upload_picture
    @form.fill_comment(place_comment)
    @form.click_create_cancel("create")
  end
end

RSpec.configure do |rspec|
  rspec.include_context "Fill new object form", :include_shared => true
end
