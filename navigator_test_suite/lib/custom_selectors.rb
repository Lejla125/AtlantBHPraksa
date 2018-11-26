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
end

Capybara.add_selector(:message_box_content) do
  xpath {"//div[@class=\"marker-popup\"]/div[@class=\"content\"]"}
end

Capybara.add_selector(:no_results) do
  xpath {"//div[@class=\"no-search-results common-shadow\"]"}
end

Capybara.add_selector(:element_on_left_pane) do
  xpath {"//ul[@class=\"menu_content_list search-results\"]"}
end

Capybara.add_selector(:primary_sidebar) do
  xpath {"//ul[@class=\"menu_content_list categories\"]"}
end

Capybara.add_selector(:menu_list) do
  xpath {"//div[@class=\"ember-view left-menu-pane list-container mCustomScrollbar _mCS_2\"]"}
end

Capybara.add_selector(:sidebar_item) do
  xpath {|arg| "//ul[@class=\"menu_content_list search-results\"]/li[@class=\"ember-view street\"]/div[@class=\"content\"]/div[contains(text(),#{arg})]"}
end

Capybara.add_selector(:page_body) do
  xpath {"//div[@id=\"page-body-content\"]"}
end

Capybara.add_selector(:comment_form) do
  xpath {"//div[@class=\"mCSB_container mCS_no_scrollbar\"]"}
end

Capybara.add_selector(:new_object_form) do
  xpath {"//div[@class=\"mCSB_container\"]"}
end

Capybara.add_selector(:tag) do
  xpath {"//ul[@class=\"ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all\"]/li[@class=\"ui-menu-item\"]/a"}
end

Capybara.add_selector(:dragger) do
  xpath {"//div[@class=\"mCSB_scrollTools\"]/div[@class=\"mCSB_draggerContainer\"]/div[@class=\"mCSB_dragger\"]"}
end
