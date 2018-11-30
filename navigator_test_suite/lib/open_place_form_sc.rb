RSpec.configure do |rspec|
  # This config option will be enabled by default on RSpec 4,
  # but for reasons of backwards compatibility, you have to
  # set it on RSpec 3.
  #
  # It causes the host group and examples to inherit metadata
  # from the shared context.
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context "Open add new object form"  do 

  it "clicks on \"Kreiraj objekat\" item and checks if empty form appears" do
    @navigation.click_add_new_object_item
    expect(@navigation.finds_new_object_form?).to eq true
  end
end

RSpec.configure do |rspec|
  rspec.include_context "Open add new object form", :include_shared => true
end
