Capybara.add_selector(:navigation) do
  xpath { "//div[@id=\"header_container\"]" }
end

Capybara.add_selector(:left_pane) do
  xpath { "//ul[@class=\"menu_content_list search-results\"]" }
end

Capybara.add_selector(:element_on_left_pane) do
  xpath { |arg| "//ul[@class=\"menu_content_list search-results\"]/li/a[@href=\"#/p/#{arg.downcase}\"]" }
end

Capybara.add_selector(:detailed_element_on_left_pane) do
  xpath { "//div[@class=\"place-body\"]" }
end