require './spec_helper'

#This test script adds no data place leaving every form field empty.

describe "NEGATIVE TEST CASE: Add no data place" do

  before(:all) do
    @navigation = @homepage.get_main.get_navigation
    @form = @homepage.get_main.get_new_object_form
  end

  include_context "Open add new object form"

  context "Click \"Kreiraj\" button at the bottom of the form" do
    it "clicks \"Kreiraj\" button and waits for appropriate message" do
       @form.new_scroll("//button[@class=\"btn btn-success\"]","down")
       @form.click_create_cancel("create")
       expect(@form.error_message_appears?("Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo")).to eq true
    end
  end

  context "Check validation message for object category" do
    it "checks if object category validation message appears" do
      @form.new_scroll("//button[@title=\"Odaberite kategoriju\"]","up")
      expect(@form.category_error_message_appears?("Molimo odaberite kategoriju kojoj objekat pripada")).to eq true
    end
  end

  context "Check borders for name text field" do
    it "checks if name field has red borders" do
      @form.new_scroll("//input[@id=\"poi_name\"]","up")
      expect(@form.check_object_name).to eq true
    end
  end
end
