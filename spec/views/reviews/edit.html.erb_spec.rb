require 'rails_helper'

RSpec.describe "reviews/edit", :type => :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :hospital => nil,
      :user => nil,
      :content => "MyText"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_hospital_id[name=?]", "review[hospital_id]"

      assert_select "input#review_user_id[name=?]", "review[user_id]"

      assert_select "textarea#review_content[name=?]", "review[content]"
    end
  end
end
