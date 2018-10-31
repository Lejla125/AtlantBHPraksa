class Main < HomePage
  def get_navigation
    Navigation.new(@session)
  end

  def get_sidebar
    Sidebar.new(@session)
  end
end