class NewObjectForm < Main
  def fill_object_name(name)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_name\"]").set(name)
    end
  end

  def fill_city_name(name)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_city_name\"]").set(name)
    end
  end

  def fill_zip_code(code)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_zip_code\"]").set(code)
    end
  end

  def fill_street_name(name)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_place_id\"]").set(name)
    end
  end

  def fill_house_number(number)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_house_number\"]").set(number)
    end
  end

  def fill_alt_street(name)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_street_name_alt\"]").set(name)
    end
  end

  def fill_description(text)
    @session.within(:new_object_form) do
      @session.find("//textarea[@id=\"poi_description\"]").set(text)
    end
  end

  def click_category_button
    @session.within(:new_object_form) do
      @session.find("//button[@title=\"Odaberite kategoriju\"]").click
    end
  end

  def category_list_appears?
    @session.within(:new_object_form) do
      true if @session.find("//div[@class=\"span3\"]/select")
    end
  end

  def choose_category(num)
    @session.within(:new_object_form) do
      @session.find("//div[@class=\"span3\"]/select").click
      @session.find("//div[@class=\"span3\"]/select/option[@value=\"#{num}\"]").click
    end
  end

  def fill_tag(text)
    @session.within(:new_object_form) do
      @session.find("//input[@type=\"text\"][@class=\"ui-widget-content ui-autocomplete-input\"]").set(text)
    end
  end

  def finds_tag?(tag_text)
    @session.within(:new_object_form) do
      true if @session.find(:tag).text == tag_text
    end
  end

  def click_tag_text(tag_text)
    @session.within(:new_object_form) do
      found = @session.find(:tag)
      if found.text == tag_text
        found.click
      end
  end
end

  #METODA ZA SCROLL PO FORMI 
  def scroll(element_xpath)
    @session.within(:page_body) do
      dragger = @session.find(:dragger)
      area = @session.find(element_xpath)
      dragger.click.drag_to(area)
    end
  end

  def click_saturday_bttn
    @session.within(:new_object_form) do
      @session.find("//div[@class=\"row days-buttons\"]/button[@id=\"btn_day_sat\"]").click
    end
  end

  def click_sunday_bttn
    @session.within(:new_object_form) do
      button_days = ["//div[@class=\"row days-buttons\"]/button[@id=\"btn_day_mon\"]","//div[@class=\"row days-buttons\"]/button[@id=\"btn_day_tue\"]","//div[@class=\"row days-buttons\"]/button[@id=\"btn_day_wed\"]","//div[@class=\"row days-buttons\"]/button[@id=\"btn_day_thu\"]","//div[@class=\"row days-buttons\"]/button[@id=\"btn_day_fri\"]","//div[@class=\"row days-buttons\"]/button[@id=\"btn_day_sat\"]","//div[@class=\"row days-buttons\"]/button[@id=\"btn_day_sun\"]"]
      button_days.each {|path| @session.find(path).click}
    end
  end

  def fill_working_hours(from,to)
    @session.within(:new_object_form) do
      @session.find("//div[@class=\"row whours_input\"]/input[@id=\"working_hours_0_0\"]").set(from)
      @session.find("//div[@class=\"row whours_input\"]/input[@id=\"working_hours_0_1\"]").set(to)
      @session.find("//button[@class=\"btn btnAddWorkingHours\"]").click
    end
  end

  def finds_working_hours_info?
    @session.within(:new_object_form) do
      true if @session.find("//div[@class=\"selected-whours-heading\"]").text == "Odabrali ste:"
    end
  end

  def fill_telephone_number(number)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_phone\"]").set(number)
    end
  end

  def fill_mobile_number(number)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_mobile_phone\"]").set(number)
    end
  end

  def fill_fax_number(number)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_fax\"]").set(number)
    end
  end

  def fill_weblink(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_web\"]").set(link)
    end
  end

  def fill_fblink(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_facebook_url\"]").set(link)
    end
  end

  def fill_iglink(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_instagram_url\"]").set(link)
    end
  end

  def fill_wikilink(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_wikipedia_url\"]").set(link)
    end
  end

  def fill_ytlink(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_youtube_url\"]").set(link)
    end
  end

  def fill_email(adress)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_email\"]").set(adress)
    end
  end

  def fill_twitterlink(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_twitter_url\"]").set(link)
    end
  end

  def fill_fsquarelink(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_foursqare_url\"]").set(link)
    end
  end

  def fill_tripadvisorlink(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_tripadvisor_url\"]").set(link)
    end
  end

  def fill_ighashtag(link)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_instagram_hashtag\"]").set(link)
    end
  end

  def fill_wifi_info(pass,name)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_has_wifi\"]").click
      @session.find("//input[@id=\"poi_wifi_pass\"]").set(pass)
      @session.find("//input[@id=\"poi_wifi_ssid\"]").set(name)
    end
  end

  def fill_credit_cards_info
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_accepts_credit_cards\"]").click
      credit_cards = ["//input[@id=\"chk_credit_card_1\"]","//input[@id=\"chk_credit_card_2\"]","//input[@id=\"chk_credit_card_3\"]","//input[@id=\"chk_credit_card_4\"]","//input[@id=\"chk_credit_card_5\"]"]
      credit_cards.each {|card| @session.find(card).click}
    end
  end

  def upload_picture
    @session.within(:new_object_form) do
      @session.attach_file('fileToUpload',File.absolute_path("bingo.jpg"))
    end
  end

  def fill_comment(comment)
    @session.within(:new_object_form) do
      @session.find("//textarea[@id=\"poi_comment\"]").set(comment)
    end
  end

  def click_create
    @session.within(:new_object_form) do
      @session.find("//button[@class=\"btn btn-success\"]").click
    end
  end

  def error_message_appears?(message)
    @session.within(:new_object_form) do
      @session.find("//div[@class=\"row validation-error-msg\"]").text == message
    end
  end
end
