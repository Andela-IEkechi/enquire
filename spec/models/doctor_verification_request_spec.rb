require 'rails_helper'

RSpec.describe DoctorVerificationRequest, type: :model do

  it "has a valid factory" do
    request = FactoryGirl.build(:doctor_verification_request)
    expect(request).to be_valid
  end

  describe "validations" do
    context "presence" do
      before :all do
        @request = FactoryGirl.build(:doctor_verification_request, user: nil, message: nil, hospital: nil)
        @request.save
      end

      it "validates the presence of message" do
        expect(@request.errors[:message]).to be_present
      end

      it "validates the presence of user" do
        expect(@request.errors[:user]).to be_present
      end

      it "validates the presence of hospital" do
        expect(@request.errors[:hospital]).to be_present
      end
    end

    it "validates uniqueness of the user" do
      first = FactoryGirl.create(:doctor_verification_request)
      duplicate = FactoryGirl.build(:doctor_verification_request, user: first.user)
      duplicate.save
      expect(duplicate.errors[:user]).to be_present
    end

    context "eligibility" do
      before :all do
        user = FactoryGirl.create(:user, :verified_doctor)
        hospital = FactoryGirl.create(:hospital, :un_verified)
        @request = FactoryGirl.build(:doctor_verification_request, user: user, hospital: hospital)
        @request.save
      end

      it "validates that the doctor is previously unverified" do
        expect(@request.user).to be_present
        expect(@request.errors[:user]).to be_present
      end

      it "validates that the doctor is previously unverified" do
        expect(@request.hospital).to be_present
        expect(@request.errors[:hospital]).to be_present
      end
    end

    it "saves valid factory" do
      expect{ FactoryGirl.create(:doctor_verification_request) }.to change{ DoctorVerificationRequest.count }.by 1
    end
  end

  context "on destroy" do
    before :each do
      @doctor_verification_request = FactoryGirl.create(:doctor_verification_request)
      @doc = @doctor_verification_request.user
    end

    it "updates the doctor to verified" do
      expect{ @doctor_verification_request.destroy }.to change{ @doc.verified }.to true
    end

    it "updates the doctor's hospital to requested hospital" do
      hospital = @doctor_verification_request.hospital
      expect{ @doctor_verification_request.destroy }.to change{ @doc.hospital }.to hospital
    end
  end
end
