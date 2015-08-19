require 'rails_helper'

RSpec.describe HospitalList, type: :model do
  it "has a valid factory" do
    hospital_list = FactoryGirl.build(:hospital_list)
    expect(hospital_list).to be_valid
  end

  describe 'validations' do
    context 'for presence' do
      before :all do
        @hospital_list = FactoryGirl.build(:hospital_list, user: nil, hospital: nil)
        @hospital_list.save
      end

      it "throws error when user is nil" do
        expect(@hospital_list.errors[:user]).to be_present
      end

      it "throws error when hospital is nil" do
        expect(@hospital_list.errors[:hospital]).to be_present
      end
    end

    it "ensures that a list is unique" do
      @hospital_list = FactoryGirl.create(:hospital_list)
      hospital_list_2 = FactoryGirl.build(:hospital_list, hospital: @hospital_list.hospital)
      hospital_list_2.save
      expect(hospital_list_2.errors[:hospital]).to be_present
    end

    it "saves a valid list" do
      expect{ FactoryGirl.create(:hospital_list) }.to change{HospitalList.count}.by 1
    end

    it "ensures that its hospital gets unverified on deletion" do
      @hospital_list = FactoryGirl.create(:hospital_list)
      expect{ @hospital_list.destroy }.to change{ @hospital_list.hospital.verified }.to false
    end
  end
end
