require 'rails_helper'

RSpec.describe "DoctorVerificationRequests", type: :request do
  describe "GET /doctor_verification_requests" do
    it "works! (now write some real specs)" do
      get doctor_verification_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
