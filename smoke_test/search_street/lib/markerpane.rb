class MarkerPane < Main
  def finds_item?
    @session.within(:marker_pane) do
    true if @session.find(:marked_place)
  end
 end
end
