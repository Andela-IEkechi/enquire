require 'rails_helper'

RSpec.describe "hospitals/edit", :type => :view do
  before(:each) do
    @hospital = assign(:hospital, Hospital.create!(
      :name => "MyText",
      :description => "MyText",
      :image => "MyString",
      :verified => false,
      :address => "MyText",
      :type => ""
    ))
  end

  it "renders the edit hospital form" do
    render

    assert_select "form[action=?][method=?]", hospital_path(@hospital), "post" do

      assert_select "textarea#hospital_name[name=?]", "hospital[name]"

      assert_select "textarea#hospital_description[name=?]", "hospital[description]"

      assert_select "input#hospital_image[name=?]", "hospital[image]"

      assert_select "input#hospital_verified[name=?]", "hospital[verified]"

      assert_select "textarea#hospital_address[name=?]", "hospital[address]"

      assert_select "input#hospital_type[name=?]", "hospital[type]"
    end
  end
end
