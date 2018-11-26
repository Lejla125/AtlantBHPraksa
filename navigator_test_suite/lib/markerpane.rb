class MarkerPane < Main
  def finds_item?
      @session.within(:marker_pane) do
      true if @session.find(:marked_place)
    end
 end

  def message_pops_up?
    @session.within(:message_box) do
      true if @session.find(:message_box_content)
    end
  end

  def item_name_exists?(item_name)
    @session.within(:message_box) do
      true if @session.find("//div[@class=\"name\"]").text == item_name
    end
  end

  def item_address_exists?(item_address)
      @session.within(:message_box) do
        true if @session.find("//div[@class=\"leaflet-popup-content\"]/div[@class=\"marker-popup\"]/div[@class=\"content\"]/div[@class=\"address\"]").text == item_address
      end
    end

  def item_working_hours_exist?
    @session.within(:message_box) do
      true if @session.find("//div[@class=\"working-hours\"]")
    end
  end

  def sf_places_shown_on_map?
    true if @session.find("//img[@src=\"https://maps.wikimedia.org/osm-intl/14/9030/5966.png\"]")
  end

  def item_phone_number_exists?(item_phone)
    @session.within(:message_box) do
      true if @session.find("//div[@class=\"phone-and-web\"]/div[@class=\"phone\"]").text == item_phone
    end
  end

  def item_weblink_exists?(item_link)
    @session.within(:message_box) do
      true if @session.find("//div[@class=\"phone-and-web\"]/div[@class=\"web\"]/a[@href=\"#{item_link}\"]")
    end
  end
end
