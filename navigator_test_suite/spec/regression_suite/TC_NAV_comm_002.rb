require './spec_helper'
require 'shared_context/open_comments_sc'


describe "NEGATIVE TEST CASE: Verify the comments/suggestions section" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
  end

  include_context "Open comments/suggestions form"

  context "Fill in the empty form and click send button" do
    it "fills in the form and checks invalid data info" do
      @navigation.set_name_and_surname("Lejla Dzaferbegovic")
      @navigation.set_email("kl;;'")
      @navigation.click_kritika
      @navigation.click_send
      expect(@navigation.email_borders_red?).to eq true
      expect(@navigation.comment_borders_red?).to eq true
    end
  end
end
