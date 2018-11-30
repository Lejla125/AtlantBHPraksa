RSpec.configure do |rspec|
  # This config option will be enabled by default on RSpec 4,
  # but for reasons of backwards compatibility, you have to
  # set it on RSpec 3.
  #
  # It causes the host group and examples to inherit metadata
  # from the shared context.
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context "Fill search bar and check sidebar", :shared_context => :metadata do |item_name|

  it "enters valid data into search bar, clicks on item from the dropdown menu, finds searched item: #{item_name} and shows on sidebar" do
      @navigation.fill_in_searchbox(item_name)
      @navigation.click_on_dropdown_item
      expect(@sidebar.exists_with_item?(item_name)).to eq true
  end
end

RSpec.configure do |rspec|
  rspec.include_context "Fill search bar and check sidebar", :include_shared => true
end
