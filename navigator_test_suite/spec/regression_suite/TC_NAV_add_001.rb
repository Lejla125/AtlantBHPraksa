require './spec_helper'
require './shared_context'

describe "NEGATIVE TEST CASE: Add no data place" do
  include_context "shared methods"

  before(:all) do
    @form = @homepage.get_main.get_new_object_form
  end

  context "Open add new object form" do
    it "clicks on \"Kreiraj objekat\" item and checks if empty form appears" do
      expect(open_new_object_form).to eq true
    end
  end

  context "Click \"Kreiraj\" button at the bottom of the form" do
    it "clicks \"Kreiraj\" button and waits for appropriate message" do
       @form.scroll("//textarea[@id=\"poi_description\"]")
       @form.scroll("//input[@id=\"poi_phone\"]")
       @form.scroll("//input[@id=\"poi_web\"]")
       @form.click_create
       expect(@form.error_message_appears?("Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo")).to eq true
    end
  end
end
