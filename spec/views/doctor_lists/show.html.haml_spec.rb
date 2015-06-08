require 'rails_helper'

RSpec.describe "doctor_lists/show", type: :view do
  before(:each) do
    @doctor_list = assign(:doctor_list, DoctorList.create!(
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
