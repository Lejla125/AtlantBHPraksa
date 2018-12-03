shared_context "Open add new object form"  do 
  it "clicks on \"Kreiraj objekat\" item and checks if empty form appears" do
    @navigation.click_add_new_object_item
    expect(@navigation.finds_new_object_form?).to eq true
  end
end
