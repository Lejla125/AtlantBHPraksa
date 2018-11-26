require './spec_helper'

describe "NEGATIVE TEST CASE: Verify the comments/suggestions section" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
  end

  context "Open comments/suggestions form" do
    it "clicks on \"Predlozi ideju – Posalji komentar\" item and checks if empty form appears" do
      @navigation.click_comments_item
      expect(@navigation.finds_comments_form?).to eq true
    end
  end

  context "Fill in the empty form and click send button" do
    it "fills in the form and checks invalid data info" do
      @navigation.set_name_and_surname("Lejla Dzaferbegovic")
      @navigation.set_email("kl;;'")
      @navigation.click_Kritika
      @navigation.click_send
      expect(@navigation.email_borders_red?).to eq true
      expect(@navigation.comment_borders_red?).to eq true
    end
  end
end
