require 'rails_helper'

RSpec.describe "hospital_verification_requests/new", type: :view do
  before(:each) do
    assign(:hospital_verification_request, HospitalVerificationRequest.new(
      :user => nil,
      :hospital => nil,
      :message => "MyText"
    ))
  end

  it "renders new hospital_verification_request form" do
    render

    assert_select "form[action=?][method=?]", hospital_verification_requests_path, "post" do

      assert_select "input#hospital_verification_request_user_id[name=?]", "hospital_verification_request[user_id]"

      assert_select "input#hospital_verification_request_hospital_id[name=?]", "hospital_verification_request[hospital_id]"

      assert_select "textarea#hospital_verification_request_message[name=?]", "hospital_verification_request[message]"
    end
  end
end
