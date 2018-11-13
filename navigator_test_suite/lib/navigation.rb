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
end
