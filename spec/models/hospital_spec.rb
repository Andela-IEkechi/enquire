require 'rails_helper'

RSpec.describe Hospital, :type => :model do
  it "has a valid factory" do
    hospital = FactoryGirl.build(:hospital)
    expect(hospital).to be_valid
  end

  describe "validations" do
    context "for presence" do
      before :all do
        @hospital = FactoryGirl.build(:hospital, name: nil, address: nil, classification: nil, image: nil, manager: nil)
        @hospital.save
      end

      it "validates the presence of name" do
        expect(@hospital.errors[:name]).to be_present
      end

      it "validates the presence of address" do
        expect(@hospital.errors[:address]).to be_present
      end

      it "validates the presence of classification" do
        expect(@hospital.errors[:classification]).to be_present
      end

      it "validates the presence of manager" do
        expect(@hospital.errors[:manager]).to be_present
      end
    end

    context "custom" do
      it "validates that the leading user(manager) is not a client" do
        user = FactoryGirl.create(:user, :client)
        @hospital = FactoryGirl.build(:hospital, manager: user)
        @hospital.save
        expect(@hospital.errors[:manager]).to be_present
      end

      it "validates that the leading user(manager) is not a doctor" do
        user = FactoryGirl.create(:user, :doctor)
        @hospital = FactoryGirl.build(:hospital, manager: user)
        @hospital.save
        expect(@hospital.errors[:manager]).to be_present
      end

      it "validates that the leading user(manager) is a manager" do
        user = FactoryGirl.create(:user, :manager)
        @hospital = FactoryGirl.build(:hospital, manager: user)
        @hospital.save
        expect(@hospital.errors[:manager]).not_to be_present
      end

      it "validates that image is not larger than 5mb" do
        skip "add some examples to this for testing the image size on a hospital instance"
      end
    end

    it "saves a valid hospital" do
      expect{ FactoryGirl.create(:hospital) }.to change{ Hospital.count }.by 1
    end

    describe "relationships" do
      it "permits a hospital to have more than one likes" do
        hospital = FactoryGirl.create(:hospital, :verified)
        FactoryGirl.create(:hospital_like, hospital: hospital)
        expect{ FactoryGirl.create(:hospital_like, hospital: hospital) }.to change{ hospital.hospital_likes.count }.by 1
        expect(hospital.hospital_likes.count).to eq 2
      end

      it "permits a hospital to have more than one user" do
        user = FactoryGirl.create(:user, :client)
        FactoryGirl.create(:hospital_like, user: user)
        expect{ FactoryGirl.create(:hospital_like, user: user) }.to change{ user.hospital_likes.count }.by 1
        expect(user.hospital_likes.count).to eq 2
      end

      it "permits a hospital to have more than one doctor" do
        hospital = FactoryGirl.create(:hospital, :verified)
        FactoryGirl.create(:doctor_list, hospital: hospital)
        expect{ FactoryGirl.create(:doctor_list, hospital: hospital) }.to change{ hospital.doctors.count }.by 1
        expect(hospital.doctors.count).to eq 2
      end

      it "does not permits a hospital to have more than one hospital_verification_request" do
        hospital = FactoryGirl.create(:hospital, :un_verified)
        FactoryGirl.create(:hospital_verification_request, hospital: hospital)
        request_2 = FactoryGirl.build(:hospital_verification_request, hospital: hospital)
        expect{ request_2.save }.not_to change{ HospitalVerificationRequest.count }
      end
    end
  end

  describe "#doctors" do
    it "returns a list of doctors for the specified hospital" do
      hospital = FactoryGirl.create(:hospital, :verified)
      list = FactoryGirl.create_list(:doctor_list, 2, hospital: hospital)
      doctors = list.map(&:user)

      expect(hospital.doctors).to eq doctors
    end
  end
end
