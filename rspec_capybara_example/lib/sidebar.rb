class Sidebar < Main
  def exists_with_item?(item_name)
    true if @session.find(:element_on_left_pane, item_name)
  end

  def click_on_sidebar_item(item_name)
    @session.within(:left_pane) do
      @session.find(:element_on_left_pane, item_name).click
    end
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

  def item_phone_exists?(item_phone)
    @session.within(:detailed_element_on_left_pane) do
      true if @session.find("//div[@class=\"left-side\"]/div[@class=\"phone-details\"]").text == item_phone
    end
  end
end