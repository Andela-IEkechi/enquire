require 'rails_helper'

RSpec.describe DoctorLike, :type => :model do


  context "validation" do
    before :all do
      @doctor = FactoryGirl.create(:user, :doctor)
      @client = FactoryGirl.create(:user, :client)
      @like = DoctorLike.new
      @like.save
    end

    it "validates presence of doctor" do
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
      doc = FactoryGirl.create(:user, :doctor)
      like = DoctorLike.new(doctor: doc)
      like.save
      expect(like.errors[:doctor]).to be_present
    end

    it "saves valid likes" do
      expect{DoctorLike.create(user: @client, doctor: @doctor)}.to change{DoctorLike.count}.by 1
    end

    it "has unique user ids..." do
      expect{DoctorLike.create(user: @client, doctor: @doctor)}.to change{AnswerLike.count}.by 1
      like_duplicate = DoctorLike.new(user: @client, doctor: @doctor)
      like_duplicate.save
      expect(like_duplicate.errors[:user]).to be_present
    end
  end
end

