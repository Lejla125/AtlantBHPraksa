RSpec.configure do |rspec|
  # This config option will be enabled by default on RSpec 4,
  # but for reasons of backwards compatibility, you have to
  # set it on RSpec 3.
  #
  # It causes the host group and examples to inherit metadata
  # from the shared context.
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context "Open comments/suggestions form" do

  it "clicks on \"Predlozi ideju – Posalji komentar\" item and checks if empty form appears" do
    @navigation.click_comments_item
    expect(@navigation.finds_comments_form?).to eq true
  end
end

RSpec.configure do |rspec|
  rspec.include_context "Open comments/suggestions form", :include_shared => true
end
