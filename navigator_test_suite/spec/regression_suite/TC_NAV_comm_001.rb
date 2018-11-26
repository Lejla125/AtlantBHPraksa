require './spec_helper'

describe "POSITIVE TEST CASE: Verify the comments/suggestions section" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
  end

  context "Open comments/suggestions form" do
    it "clicks on \"Predlozi ideju – Posalji komentar\" item and checks if empty form appears" do
      @navigation.click_comments_item
      expect(@navigation.finds_comments_form?).to eq true
    end
  end

  context "Fill in the empty form and send comment" do
    it "fills in the form and sends comment to the dev team" do
      @navigation.set_name_and_surname("Lejla Dzaferbegovic")
      @navigation.set_email("lejla.dzaferbegovic@gmail.com")
      @navigation.set_comment("Test")
      @navigation.click_Pohvala
      @navigation.click_send
      expect(@navigation.success_info_message_appears?("Hvala na poruci! Potrudit ćemo se da što prije reagujemo.")).to eq true
    end
  end
end
