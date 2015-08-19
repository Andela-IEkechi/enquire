require 'rails_helper'

RSpec.describe HospitalLike, :type => :model do
  it "has a valid factory" do
    like = FactoryGirl.build(:hospital_like)
    expect(like).to be_valid
  end

  describe "validation" do
    context "for presence" do
      before :all do
        @hospital_like = FactoryGirl.build(:hospital_like, user: nil, hospital: nil)
        @hospital_like.save
      end
      it "throws an error when user is nil" do
        expect(@hospital_like.errors[:user]).to be_present
      end

      it "throws an error when hospital is nil" do
        expect(@hospital_like.errors[:hospital]).to be_present
      end
    end

    context 'for uniqueness' do
      before :all do
        @hospital_like = FactoryGirl.create(:hospital_like)
        @hospital = @hospital_like.hospital
        @hospital_like_2 = FactoryGirl.build(:hospital_like, user: @hospital_like.user, hospital: @hospital)
      end

      it "does not allow a user to like an hospital more than once" do
        expect{ @hospital_like_2.save }.not_to change{@hospital.hospital_likes.count}
      end

      it "throws an error when user tries to like an hospital more than once" do
        @hospital_like_2.save
        expect(@hospital_like_2.errors[:user]).to be_present
      end
    end

    it "saves a valid like" do
      expect{  FactoryGirl.create(:hospital_like) }.to change{ HospitalLike.count }.by 1
    end

    context 'is_a_client' do
      it 'ensures that the user liking an hospital is not a manager' do
        manager = FactoryGirl.create(:user, :manager)
        hospital_like = FactoryGirl.build(:hospital_like, user: manager)
        hospital_like.save
        expect(hospital_like.errors[:user]).to be_present
      end

      it 'ensures that the user liking an hospital is not a doctor' do
        doctor = FactoryGirl.create(:user, :doctor)
        hospital_like = FactoryGirl.build(:hospital_like, user: doctor)
        hospital_like.save
        expect(hospital_like.errors[:user]).to be_present
      end

      it 'ensures that the user liking an hospital is a client' do
        client = FactoryGirl.create(:user, :client)
        expect{ FactoryGirl.create(:hospital_like, user: client) }.to change{ HospitalLike.count }.by 1
      end
    end
  end
end
