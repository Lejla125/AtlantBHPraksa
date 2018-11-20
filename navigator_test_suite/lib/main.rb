class Main < HomePage
  def get_navigation
    Navigation.new(@session)
  end

  def get_sidebar
    Sidebar.new(@session)
  end

  def get_marker_pane
    MarkerPane.new(@session)
  end
end
