require 'rails_helper'

RSpec.describe DoctorLike, :type => :model do

  it 'should have a valid factory' do
    like = FactoryGirl.build(:doctor_like)
    expect(like).to be_valid
  end


  context "validation" do
    before :all do
      @doctor = FactoryGirl.create(:user, :doctor)
      @client = FactoryGirl.create(:user, :client)
      @like = DoctorLike.new
      @like.save
    end

    it "validates presence of doctor" do
      skip "why is a doctor like not linked to the doctor?"
      expect(@like.errors[:doctor]).to be_present
    end

    it "validates presence of user" do
      expect(@like.errors[:user]).to be_present
    end

    it "validates user is a 'client'" do
      doc = FactoryGirl.create(:user, :doctor)
      like = DoctorLike.new(user: doc)
      like.save
      expect(like.errors[:user]).to be_present
    end

    it "validates doctor is a 'verified doctor'" do
      skip "why is a doctor like not linked to the doctor?"
      doc = FactoryGirl.create(:user, :doctor)
      like = DoctorLike.new(doctor: doc)
      like.save
      expect(like.errors[:doctor]).to be_present
    end

    it "saves valid likes" do
      expect{ FactoryGirl.create(:doctor_like) }.to change{DoctorLike.count}.by 1
    end

    it "has unique user ids..." do
      skip "why is a doctor like not linked to the doctor?"
      expect{DoctorLike.create(user: @client)}.to change{DoctorLike.count}.by 1
      like_duplicate = DoctorLike.new(user: @client)
      like_duplicate.save

      expect(like_duplicate.errors[:user]).to be_present
    end
  end
end

