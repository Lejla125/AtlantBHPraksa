shared_context "Fill search bar and check sidebar" do |item_name|
  it "enters valid data into search bar, clicks on item from the dropdown menu, finds searched item: #{item_name} and shows on sidebar" do
      @navigation.fill_in_searchbox(item_name)
      @navigation.click_on_dropdown_item
      expect(@sidebar.exists_with_item?(item_name)).to eq true
  end
end
