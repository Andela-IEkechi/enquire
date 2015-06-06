require 'rails_helper'

RSpec.describe "HospitalVerificationRequests", type: :request do
  describe "GET /hospital_verification_requests" do
    it "works! (now write some real specs)" do
      get hospital_verification_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
