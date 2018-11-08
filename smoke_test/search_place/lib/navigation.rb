class Navigation < Main
  def fill_in_searchbox(content)
    @session.within(:navigation) do
      @session.find("//div[@id=\"header_search\"]/div/span/input[@class=\"ember-view ember-text-field tt-query\"]").set(content)
    end
  end
end
