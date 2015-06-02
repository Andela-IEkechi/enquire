require 'rails_helper'

RSpec.describe "user_profiles/show", :type => :view do
  before(:each) do
    @user_profile = assign(:user_profile, UserProfile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Ethnicity/)
    expect(rendered).to match(/Occupation/)
    expect(rendered).to match(/Religion/)
    expect(rendered).to match(/Marital Status/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
