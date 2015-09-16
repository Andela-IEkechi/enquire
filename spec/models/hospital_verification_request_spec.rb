require 'rails_helper'

RSpec.describe HospitalVerificationRequest, type: :model do
  it "has a valid factory" do
    request = FactoryGirl.build(:hospital_verification_request)
    expect(request).to be_valid
  end

  describe "validations" do
    context 'for presence' do
      before :all do
        @request = FactoryGirl.build(:hospital_verification_request, user: nil, hospital: nil, message: nil)
        @request.save
      end

      it "should throw an error when user is nil" do
        expect(@request.errors[:user]).to be_present
      end

      it "should throw an error when hospital is nil" do
        expect(@request.errors[:hospital]).to be_present
      end

      it "should throw an error when message is nil" do
        expect(@request.errors[:message]).to be_present
      end
    end

    it "should ensure that a request is unique to an hospital" do
      @request = FactoryGirl.create(:hospital_verification_request)
      request_2 = FactoryGirl.build(:hospital_verification_request, hospital: @request.hospital)
      request_2.save
      expect(request_2.errors[:hospital]).to be_present
    end

    context 'eligibility' do
      it "should not allow request creation for already verified hospitals" do
        hospital = FactoryGirl.create(:hospital, :verified)
        request = FactoryGirl.build(:hospital_verification_request, hospital: hospital)
        result = request.save
        expect(result).to be_falsey
        expect(request.errors[:hospital]).to be_present
      end

      it "should not allow creation of request for client" do
        client = FactoryGirl.create(:user, :client)
        request = FactoryGirl.build(:hospital_verification_request, user: client)
        request.save
        expect(request.errors[:user]).to be_present
      end
    end

    it 'saves a request with valid params' do
      expect{ FactoryGirl.create(:hospital_verification_request) }.to change{ HospitalVerificationRequest.count }.by 1
    end

    context 'accepting(destroying) a HospitalVerificationRequest' do
      before :each do
        @request = FactoryGirl.create(:hospital_verification_request)
      end

      it "should update the hospital to verified" do
        expect{ @request.destroy }.to change{ @request.hospital.verified }.to true
      end

      it "should create a hospital_list for the verified hospital" do
        expect{ @request.destroy }.to change{ HospitalList.count }.by 1
      end
    end
  end
end
