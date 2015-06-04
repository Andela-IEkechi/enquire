require 'rails_helper'

RSpec.describe "user_profiles/index", :type => :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user => nil,
        :gender => "Gender",
        :address => "MyText",
        :phone_number => 1,
        :ethnicity => "Ethnicity",
        :occupation => "Occupation",
        :religion => "Religion",
        :marital_status => "Marital Status",
        :weight => 1.5,
        :height => 1.5
      ),
      Profile.create!(
        :user => nil,
        :gender => "Gender",
        :address => "MyText",
        :phone_number => 1,
        :ethnicity => "Ethnicity",
        :occupation => "Occupation",
        :religion => "Religion",
        :marital_status => "Marital Status",
        :weight => 1.5,
        :height => 1.5
      )
    ])
  end

  it "renders a list of user_profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Ethnicity".to_s, :count => 2
    assert_select "tr>td", :text => "Occupation".to_s, :count => 2
    assert_select "tr>td", :text => "Religion".to_s, :count => 2
    assert_select "tr>td", :text => "Marital Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
