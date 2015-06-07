require 'rails_helper'

RSpec.describe "hospital_verification_requests/index", type: :view do
  before(:each) do
    assign(:hospital_verification_requests, [
      HospitalVerificationRequest.create!(
        :user => nil,
        :hospital => nil,
        :message => "MyText"
      ),
      HospitalVerificationRequest.create!(
        :user => nil,
        :hospital => nil,
        :message => "MyText"
      )
    ])
  end

  it "renders a list of hospital_verification_requests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
