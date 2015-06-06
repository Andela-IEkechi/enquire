require 'rails_helper'

RSpec.describe "hospital_verification_requests/show", type: :view do
  before(:each) do
    @hospital_verification_request = assign(:hospital_verification_request, HospitalVerificationRequest.create!(
      :user => nil,
      :hospital => nil,
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
