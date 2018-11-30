require './spec_helper'

#This test script adds no data place leaving every form field empty.

describe "NEGATIVE TEST CASE: Add no data place" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
    @form = @homepage.get_main.get_new_object_form
  end

  include_context "Open add new object form" do
  end

  context "Click \"Kreiraj\" button at the bottom of the form" do
    it "clicks \"Kreiraj\" button and waits for appropriate message" do
       @form.scroll("//textarea[@id=\"poi_description\"]")
       @form.scroll("//input[@id=\"poi_phone\"]")
       @form.scroll("//input[@id=\"poi_web\"]")
       @form.click_create_cancel("create")
       expect(@form.error_message_appears?("Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo")).to eq true
    end
  end
end
