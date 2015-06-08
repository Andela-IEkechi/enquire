require 'rails_helper'

RSpec.describe "doctor_lists/index", type: :view do
  before(:each) do
    assign(:doctor_lists, [
      DoctorList.create!(
        :user => nil,
        :hospital => nil
      ),
      DoctorList.create!(
        :user => nil,
        :hospital => nil
      )
    ])
  end

  it "renders a list of doctor_lists" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
