require 'rails_helper'

RSpec.describe "doctor_verification_requests/edit", type: :view do
  before(:each) do
    @doctor_verification_request = assign(:doctor_verification_request, DoctorVerificationRequest.create!(
      :user => nil,
      :hospital => nil,
      :message => "MyText"
    ))
  end

  it "renders the edit doctor_verification_request form" do
    render

    assert_select "form[action=?][method=?]", doctor_verification_request_path(@doctor_verification_request), "post" do

      assert_select "input#doctor_verification_request_user_id[name=?]", "doctor_verification_request[user_id]"

      assert_select "input#doctor_verification_request_hospital_id[name=?]", "doctor_verification_request[hospital_id]"

      assert_select "textarea#doctor_verification_request_message[name=?]", "doctor_verification_request[message]"
    end
  end
end
