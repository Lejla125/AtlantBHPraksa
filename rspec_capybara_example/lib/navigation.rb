class Navigation < Main
  def fill_in_searchbox(content)
    @session.within(:navigation) do
      @session.find("//div[@id=\"header_search\"]/div/span/input[@class=\"ember-view ember-text-field tt-query\"]").set(content)
    end
  end

  def click_on_searchbox
    @session.within(:navigation) do
      @session.find("//div[@id=\"header_search\"]/div/a").click
    end
  end
end