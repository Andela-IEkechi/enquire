require 'rails_helper'

RSpec.describe "user_profiles/edit", :type => :view do
  before(:each) do
    @user_profile = assign(:user_profile, UserProfile.create!(
      :user => nil,
      :gender => "MyString",
      :address => "MyText",
      :phone_number => 1,
      :ethnicity => "MyString",
      :occupation => "MyString",
      :religion => "MyString",
      :marital_status => "MyString",
      :weight => 1.5,
      :height => 1.5
    ))
  end

  it "renders the edit user_profile form" do
    render

    assert_select "form[action=?][method=?]", user_profile_path(@user_profile), "post" do

      assert_select "input#user_profile_user_id[name=?]", "user_profile[user_id]"

      assert_select "input#user_profile_gender[name=?]", "user_profile[gender]"

      assert_select "textarea#user_profile_address[name=?]", "user_profile[address]"

      assert_select "input#user_profile_phone_number[name=?]", "user_profile[phone_number]"

      assert_select "input#user_profile_ethnicity[name=?]", "user_profile[ethnicity]"

      assert_select "input#user_profile_occupation[name=?]", "user_profile[occupation]"

      assert_select "input#user_profile_religion[name=?]", "user_profile[religion]"

      assert_select "input#user_profile_marital_status[name=?]", "user_profile[marital_status]"

      assert_select "input#user_profile_weight[name=?]", "user_profile[weight]"

      assert_select "input#user_profile_height[name=?]", "user_profile[height]"
    end
  end
end
