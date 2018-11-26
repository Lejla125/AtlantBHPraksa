require './spec_helper'

place_name = "jshdskjkp"
invalid_data_msg = "Žao nam je. Nismo uspjeli pronaći niti jedan rezultat za traženu pretragu."

describe "NEGATIVE TEST CASE: Enter invalid data into search bar" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
  end

  context "Enter invalid data and click on search icon" do
    it "enters: #{place_name} into search bar, clicks search and waits for message to appear" do
      @navigation.fill_in_searchbox(place_name)
      @navigation.click_on_searchbox
      expect(@navigation.search_results("Rezultati pretrage za \"#{place_name}\"")).to eq true
      expect(@navigation.info_no_results(invalid_data_msg)).to eq true
    end
  end
end
