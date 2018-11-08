class DropDown < Main
def click_on_dropdown_item
  @session.within(:drop_down) do
    @session.find("//div[@class=\"tt-suggestion\"]", :match => :first).click
  end
 end
end
