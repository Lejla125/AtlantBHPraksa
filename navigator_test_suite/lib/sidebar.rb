class Sidebar < Main
def exists_with_item?(item_name)
   true if @session.find("//ul[@class=\"menu_content_list search-results\"]/li[@class=\"ember-view street\"]/div[@class=\"content\"]/div[@class=\"name\"]").text == item_name
end

def click_on_sidebar_item(item_name)
  @session.find("//ul[@class=\"menu_content_list search-results\"]/li[@class=\"ember-view street\"]/div[@class=\"content\"]/div[contains(text(),#{item_name})]").click
 end

  def item_name_exists?(item_name)
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"name\"]").text == item_name
    end
  end

  def item_address_exists?(item_address)
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"left-side\"]/div[@class=\"address\"]").text == item_address
    end
  end

  def item_hours_exist?(working_hours)
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"hours\"]/div[@class=\"text-center\"]").text == working_hours
    end
  end

def item_category_exists?(category)
  @session.within(:detailed_element_on_left_pane) do
    true if @session.find("//div[@class=\"categories\"]").text == category
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
end
