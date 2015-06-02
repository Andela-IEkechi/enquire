require 'rails_helper'

RSpec.describe "doctor_profiles/edit", :type => :view do
  before(:each) do
    @doctor_profile = assign(:doctor_profile, DoctorProfile.create!(
      :doctor => nil,
      :gender => "MyString",
      :address => "MyText",
      :phone_number => 1,
      :ethnicity => "MyString",
      :occupation => "MyString",
      :religion => "MyString",
      :marital_status => "MyString",
      :weight => 1.5,
      :height => 1.5,
      :year_of_grad => "MyString",
      :specialization => "MyString"
    ))
  end

  it "renders the edit doctor_profile form" do
    render

    assert_select "form[action=?][method=?]", doctor_profile_path(@doctor_profile), "post" do

      assert_select "input#doctor_profile_doctor_id[name=?]", "doctor_profile[doctor_id]"

      assert_select "input#doctor_profile_gender[name=?]", "doctor_profile[gender]"

      assert_select "textarea#doctor_profile_address[name=?]", "doctor_profile[address]"

      assert_select "input#doctor_profile_phone_number[name=?]", "doctor_profile[phone_number]"

      assert_select "input#doctor_profile_ethnicity[name=?]", "doctor_profile[ethnicity]"

      assert_select "input#doctor_profile_occupation[name=?]", "doctor_profile[occupation]"

      assert_select "input#doctor_profile_religion[name=?]", "doctor_profile[religion]"

      assert_select "input#doctor_profile_marital_status[name=?]", "doctor_profile[marital_status]"

      assert_select "input#doctor_profile_weight[name=?]", "doctor_profile[weight]"

      assert_select "input#doctor_profile_height[name=?]", "doctor_profile[height]"

      assert_select "input#doctor_profile_year_of_grad[name=?]", "doctor_profile[year_of_grad]"

      assert_select "input#doctor_profile_specialization[name=?]", "doctor_profile[specialization]"
    end
  end
end
