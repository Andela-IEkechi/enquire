require 'rails_helper'

RSpec.describe DoctorList, type: :model do

  it "has a valid factory" do
    doctor_list = FactoryGirl.build(:doctor_list)

    expect(doctor_list).to be_valid
  end

  context "validation" do
    before :all do
      @doctor_list = DoctorList.new
      @doctor_list.save
    end

    it "validates presence of doctor" do
      expect(@doctor_list.errors[:user]).to be_present
    end

    it "validates presence of hospital" do
      expect(@doctor_list.errors[:hospital]).to be_present
    end

    it "validates user is a 'verified_doctor'" do
      client = FactoryGirl.create(:user, :client)
      doc_list_1 = DoctorList.new(user: client)
      doc_list_1.save
      expect(doc_list_1.errors[:user]).to be_present
    end

    it "validates hospital is 'verified'" do
      hospital = FactoryGirl.create(:hospital, :un_verified)
      doc_list_1 = DoctorList.new(hospital: hospital)
      doc_list_1.save
      expect(doc_list_1.errors[:hospital]).to be_present
    end

    it "saves valid doc_list" do
      expect{FactoryGirl.create(:doctor_list)}.to change{DoctorList.count}.by 1
    end

    it "has unique user ids...(for doctors)" do
      doc = FactoryGirl.create(:user, :verified_doctor)
      expect{FactoryGirl.create(:doctor_list, user: doc)}.to change{DoctorList.count}.by 1
      doctor_list_duplicate = FactoryGirl.build(:doctor_list, user: doc)
      doctor_list_duplicate.save
      expect(doctor_list_duplicate.errors[:user]).to be_present
    end
  end
end


