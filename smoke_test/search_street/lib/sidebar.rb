class Sidebar < Main
  def exists_with_item?
    @session.within(:element_on_left_pane) do
      true if @session.find("//img[@src=\"https://www.navigator.ba/assets/street-icon.png\"]")
    end
 end

 def click_on_sidebar_item
    @session.within(:element_on_left_pane) do
      @session.find("//img[@src=\"https://www.navigator.ba/assets/street-icon.png\"]").click
    end
  end
end
