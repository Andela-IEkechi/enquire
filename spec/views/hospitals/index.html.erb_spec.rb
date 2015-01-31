require 'rails_helper'

RSpec.describe "hospitals/index", :type => :view do
  before(:each) do
    assign(:hospitals, [
      Hospital.create!(
        :name => "MyText",
        :description => "MyText",
        :image => "Image",
        :verified => false,
        :address => "MyText",
        :type => "Type"
      ),
      Hospital.create!(
        :name => "MyText",
        :description => "MyText",
        :image => "Image",
        :verified => false,
        :address => "MyText",
        :type => "Type"
      )
    ])
  end

  it "renders a list of hospitals" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
