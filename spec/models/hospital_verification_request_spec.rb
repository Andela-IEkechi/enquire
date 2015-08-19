require 'rails_helper'

RSpec.describe HospitalVerificationRequest, type: :model do
  it "has a valid factory" do
    request = FactoryGirl.build(:hospital_verification_request)
    expect(request).to be_valid
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
