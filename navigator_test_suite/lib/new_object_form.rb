class NewObjectForm < Main
  def fill_object_name(name)
    @session.within(:new_object_form) do
      @session.find("//input[@id=\"poi_name\"]").set(name)
    end
  end

  def check_object_name
    @session.within(:new_object_form) do
      true if @session.find("//input[@id=\"poi_name\"][@style=\"border-color: rgb(185, 74, 72);\"]")
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

  def category_error_message_appears?(message)
    @session.within(:new_object_form) do
      true if @session.find("//div[@class=\"categories-error-msg\"]").text == message
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

  def new_scroll(element_xpath,direction)
    @session.within(:page_body) do
      slider = @session.driver.browser.find_element(:xpath, "//div[@class=\"mCSB_scrollTools\"]/div[@class=\"mCSB_draggerContainer\"]/div[@class=\"mCSB_dragger\"]")
      current_attempt = 1
      max_attempts = 10
      Capybara.default_max_wait_time = 5
      begin
        while (current_attempt < max_attempts) do
          current_attempt = current_attempt + 1
          @session.driver.browser.action.click_and_hold(slider).perform
          if(direction == "up")
          @session.driver.browser.action.move_by(0, -200).perform
          else
          @session.driver.browser.action.move_by(0, 200).perform
          end
          @session.driver.browser.action.release.perform
          @session.find(element_xpath)

          puts "Element found: #{element_xpath}"
          break
        end
      rescue
        puts "Element not found in attempt #{current_attempt}, move slider again..."
        retry
      end
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

  def whours_error_appears?
    true if @session.find("//div[@class=\"alertify-dialog\"]/article/p[@class=\"alertify-message\"]")
  end

  def remove_whours_error
    @session.within("//div[@class=\"alertify-dialog\"]") do
      @session.find("//button[@id=\"alertify-ok\"]").click
    end
  end

  def fill_phone_number(phone_type,number)
    @session.within(:new_object_form) do
      case phone_type
    when "telephone"
      @session.find("//input[@id=\"poi_phone\"]").set(number)
    when "mobile"
      @session.find("//input[@id=\"poi_mobile_phone\"]").set(number)
    when "fax"
      @session.find("//input[@id=\"poi_fax\"]").set(number)
      end
    end
  end

  def check_numbers_fields(phone_type)
    @session.within(:new_object_form) do
      case phone_type
      when "telephone"
        true if @session.find("//div[@class=\"span3\"]/input[@id=\"poi_phone\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "mobile"
        true if @session.find("//div[@class=\"span3\"]/input[@id=\"poi_mobile_phone\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "fax"
         true if @session.find("//div[@class=\"span3\"]/input[@id=\"poi_fax\"][@style=\"border-color: rgb(185, 74, 72);\"]")
       end
     end
  end

  def fill_link(type,link)
    @session.within(:new_object_form) do
      case type
      when "web"
        @session.find("//input[@id=\"poi_web\"]").set(link)
      when "facebook"
        @session.find("//input[@id=\"poi_facebook_url\"]").set(link)
      when "instagram"
        @session.find("//input[@id=\"poi_instagram_url\"]").set(link)
      when "wikipedia"
        @session.find("//input[@id=\"poi_wikipedia_url\"]").set(link)
      when "youtube"
        @session.find("//input[@id=\"poi_youtube_url\"]").set(link)
      when "email"
        @session.find("//input[@id=\"poi_email\"]").set(link)
      when "twitter"
        @session.find("//input[@id=\"poi_twitter_url\"]").set(link)
      when "foursquare"
        @session.find("//input[@id=\"poi_foursqare_url\"]").set(link)
      when "tripadvisor"
        @session.find("//input[@id=\"poi_tripadvisor_url\"]").set(link)
      when "hashtag"
        @session.find("//input[@id=\"poi_instagram_hashtag\"]").set(link)
      end
    end
  end

  def check_link_field(type)
    @session.within(:new_object_form) do
      case type
      when "web"
        true if @session.find("//input[@id=\"poi_web\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "facebook"
        true if @session.find("//input[@id=\"poi_facebook_url\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "instagram"
        true if @session.find("//input[@id=\"poi_instagram_url\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "wikipedia"
        true if @session.find("//input[@id=\"poi_wikipedia_url\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "youtube"
        true if @session.find("//input[@id=\"poi_youtube_url\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "email"
        true if @session.find("//input[@id=\"poi_email\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "twitter"
        true if @session.find("//input[@id=\"poi_twitter_url\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "foursquare"
        true if @session.find("//input[@id=\"poi_foursqare_url\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      when "tripadvisor"
        true if @session.find("//input[@id=\"poi_tripadvisor_url\"][@style=\"border-color: rgb(185, 74, 72);\"]")
      end
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

  def click_create_cancel(which)
    @session.within(:new_object_form) do
      case which
      when "create"
        @session.find("//button[@class=\"btn btn-success\"]").click
      when "cancel"
        @session.find("//button[@class=\"btn cancel\"]").click
      end
    end
  end

  def error_message_appears?(message)
    @session.within(:new_object_form) do
      true if @session.find("//div[@class=\"row validation-error-msg\"]").text == message
    end
  end
end
