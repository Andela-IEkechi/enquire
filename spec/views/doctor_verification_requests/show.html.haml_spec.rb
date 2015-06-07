require 'rails_helper'

RSpec.describe "doctor_verification_requests/show", type: :view do
  before(:each) do
    @doctor_verification_request = assign(:doctor_verification_request, DoctorVerificationRequest.create!(
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
