shared_context "Open comments/suggestions form" do
  it "clicks on \"Predlozi ideju – Posalji komentar\" item and checks if empty form appears" do
    @navigation.click_comments_item
    expect(@navigation.finds_comments_form?).to eq true
  end
end
