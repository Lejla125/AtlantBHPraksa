class Navigation < Main
  def fill_in_searchbox(content)
    @session.within(:navigation) do
      @session.find("//div[@id=\"header_search\"]/div/span/input[@class=\"ember-view ember-text-field tt-query\"]").set(content)
    end
  end

  def click_on_dropdown_item
    @session.within(:drop_down) do
      @session.find("//div[@class=\"tt-suggestion\"]", :match => :first).click
    end
   end

   def click_on_searchbox
    @session.within(:navigation) do
      @session.find("//div[@id=\"header_search\"]/div/a").click
    end
  end

  def search_results(results_text)
    @session.within(:no_results) do
      @session.find("//p[@class=\"search-results-for\"]").text == results_text
    end
  end

  def info_no_results(message)
    @session.within(:no_results) do
      @session.find("//p[@class=\"no-results\"]").text == message
    end
  end

  def click_comments_item
    @session.within(:navigation) do
      @session.find("//ul[@class=\"navigation left\"]/li[@title=\"Predloži ideju - Pošalji komentar\"]").click
    end
  end

  def finds_comments_form?
    @session.within(:page_body) do
      true if @session.find(:comment_form)
    end
  end

  def set_name_and_surname(input_data)
    @session.within(:comment_form) do
      @session.find("//input[@name=\"name_surname\"]").set(input_data)
    end
  end

  def set_email(input_data)
    @session.within(:comment_form) do
      @session.find("//input[@name=\"email\"]").set(input_data)
    end
  end

  def set_comment(comment)
    @session.within(:comment_form) do
      @session.find("//textarea[@title=\"Komentar\"]").set(comment)
    end
  end

  def click_Pohvala
    @session.within(:comment_form) do
      @session.find("//input[@value=\"Pohvala\"]").click
    end
  end

  def click_Kritika
    @session.within(:comment_form) do
      @session.find("//input[@value=\"Kritika\"]").click
    end
  end

  def click_send
    @session.within(:comment_form) do
      @session.find("//input[@value=\"Pošalji\"]").click
    end
  end

  def success_info_message_appears?(text_mssg)
    @session.within(:comment_form) do
        true if @session.find("//div[@class=\"alert alert-success\"]").text == text_mssg
    end
  end

  def email_borders_red?
    @session.within(:comment_form) do
      true if @session.find("//input[@name=\"email\"][@style=\"border-color: rgb(185, 74, 72);\"]")
    end
  end

  def comment_borders_red?
    @session.within(:comment_form) do
      true if @session.find("//textarea[@title=\"Komentar\"][@style=\"border-color: rgb(185, 74, 72);\"]")
    end
  end

  def click_add_new_object_item
    @session.within(:navigation) do
      @session.find("//ul[@class=\"navigation left\"]/li[@title=\"Kreiraj objekat\"]").click
    end
  end

  def finds_new_object_form?
    @session.within(:page_body) do
      true if @session.find(:new_object_form)
    end
  end
end
