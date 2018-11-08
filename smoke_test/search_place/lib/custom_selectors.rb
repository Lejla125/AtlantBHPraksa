Capybara.add_selector(:navigation) do
  xpath { "//div[@id=\"header_container\"]" }
end

Capybara.add_selector(:drop_down) do
  xpath {"//span[@class=\"tt-dropdown-menu\"]"}
end

Capybara.add_selector(:detailed_element_on_left_pane) do
  xpath { "//div[@class=\"place-body\"]" }
end

Capybara.add_selector(:marker_pane) do
  xpath {"//div[@class=\"leaflet-marker-pane\"]"}
end

Capybara.add_selector(:marked_place) do
  xpath {"//div[@class=\"leaflet-marker-icon map-marker-icon leaflet-zoom-animated leaflet-clickable active\"]"}
end

Capybara.add_selector(:message_box) do
  xpath {"//div[@class=\"leaflet-popup-pane\"]"}
  #xpath {"//div[@class=\"marker-popup\"]"}
end
