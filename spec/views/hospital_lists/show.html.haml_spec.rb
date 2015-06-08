require 'rails_helper'

RSpec.describe "hospital_lists/show", type: :view do
  before(:each) do
    @hospital_list = assign(:hospital_list, HospitalList.create!(
      :user => nil,
      :hospital => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
