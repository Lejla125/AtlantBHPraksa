class MarkerPane < Main
  def finds_item?
    @session.within(:marker_pane) do
    true if @session.find(:marked_place)
  end
 end

def message_pops_up?
  @session.within(:message_box) do
    true if @session.find("//div[@class=\"marker-popup\"]/div[@class=\"content\"]")
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

def item_working_hours_exist?(working_hours)
  @session.within(:message_box) do
    true if @session.find("//div[@class=\"working-hours\"]").text == working_hours
  end
end
end
