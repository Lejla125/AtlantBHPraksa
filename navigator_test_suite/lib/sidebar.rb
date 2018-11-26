class Sidebar < Main
def exists_with_item?(item_name)
  true if @session.find("//ul[@class=\"menu_content_list search-results\"]/li[@class=\"ember-view street\"]/div[@class=\"content\"]/div[@class=\"name\"]").text == item_name
end

def click_on_sidebar_item(item_name)
  @session.find(:sidebar_item,item_name).click
end

  def item_name_exists?(item_name)
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"name\"]").text == item_name
    end
  end

def item_phone_number_exists?(item_phone)
  @session.within(:detailed_element_on_left_pane) do
    true if @session.find("//span[@class=\"phone-nmb\"]").text == item_phone
  end
end

def item_mobile_number_exists?(item_phone)
  @session.within(:detailed_element_on_left_pane) do
    true if @session.find("//span[@class=\"mobile-nmb\"]").text == item_phone
  end
end

  def item_address_exists?(item_address)
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"left-side\"]/div[@class=\"address\"]").text == item_address
    end
  end

  def item_hours_exist?
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"hours\"]")
    end
  end

  def item_category_exists?(category)
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"categories\"]").text == category
    end
  end

 def item_weblink_exists?(item_link)
   @session.within(:detailed_element_on_left_pane) do
     true if @session.find("//div[@class=\"rating-web\"]/div[@class=\"web\"]/a[@href=\"#{item_link}\"]")
   end
 end

  def item_description_exists?(description)
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"description-heading\"]").text == description
    end
  end

  def item_rating_exists?
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"star-rating\"]")
    end
  end

  def choose_sidebar_place(place_name)
    @session.within(:element_on_left_pane) do
      @session.find("//ul[@class=\"menu_content_list search-results\"]/li/a[@href=\"#/p/#{place_name.downcase}\"]").click
    end
  end

  def click_sidebar_item(object_name)
    @session.within(:primary_sidebar) do
      @session.find("//ul[@class=\"menu_content_list categories\"]/div[@class=\"ember-view list-item\"]/li[@class=\"list-item\"]/a[@href=\"#/list/#{object_name.gsub(' ','-').downcase}\"]").click
    end
  end

  def contains_menu_list
    true if @session.find(:menu_list)
  end

  def click_on_sushi_item(item_name)
    @session.find("//ul[@class=\"menu_content_list list-items\"]/li[@class=\"ember-view place food\"]/a[@class=\"ember-view\"]/div[@class=\"place-shading\"]/div[@class=\"content\"]/div[@title=\"#{item_name}\"]").click
  end
end
