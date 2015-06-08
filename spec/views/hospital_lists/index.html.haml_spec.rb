require 'rails_helper'

RSpec.describe "hospital_lists/index", type: :view do
  before(:each) do
    assign(:hospital_lists, [
      HospitalList.create!(
        :user => nil,
        :hospital => nil
      ),
      HospitalList.create!(
        :user => nil,
        :hospital => nil
      )
    ])
  end

  it "renders a list of hospital_lists" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
