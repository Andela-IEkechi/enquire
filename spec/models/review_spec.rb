require 'rails_helper'

RSpec.describe Review, :type => :model do
  it 'should have a valid factory' do
    review = FactoryGirl.build(:review)
    expect(review).to be_valid
  end

  context 'validations' do
    before :all do
      @review = FactoryGirl.build(:review, user: nil, hospital: nil, content: nil)
      @review.save
    end

    it "should throw an error for records with no associated user" do
      expect(@review.errors[:user]).to be_present
    end

    it "should throw an error for records with no associated hospital" do
      expect(@review.errors[:hospital]).to be_present
    end

    it "should throw an error for records with blank content" do
      expect(@review.errors[:content]).to be_present
    end

    it "should not save an invalid record" do
      expect{ @review.save }.not_to change{ Review.count }
    end
  end

  context '#user_is_a_client' do
    before :all do
      @review = FactoryGirl.build(:review)
    end

    it "should throw an error for user that is a doctor" do
      doc = FactoryGirl.build(:user, :doctor)
      @review.user = doc
      @review.save
      expect(@review.errors[:user]).to be_present
    end

    it "should throw an error for user that is a manager" do
      manager = FactoryGirl.build(:user, :manager)
      @review.user = manager
      @review.save
      expect(@review.errors[:user]).to be_present
    end

    it "should not throw an error for user that is a client" do
      client = FactoryGirl.build(:user, :client)
      @review.user = client
      @review.save
      expect(@review.errors[:user]).not_to be_present
    end
  end

  context '#hospital_is_verified' do
    before :all do
      @review = FactoryGirl.build(:review)
    end

    it "should throw an error for hospitals that are not verified" do
      unverified_hospital = FactoryGirl.build(:hospital, :un_verified)
      @review.hospital = unverified_hospital
      @review.save
      expect(@review.errors[:hospital]).to be_present
    end

    it "should not throw an error for hospitals that are verified" do
      verified_hospital = FactoryGirl.build(:hospital, :verified)
      @review.hospital = verified_hospital
      @review.save
      expect(@review.errors[:hospital]).not_to be_present
    end
  end

  it 'should save a valid review to record' do
    expect{ FactoryGirl.create(:review) }.to change{ Review.count }.by 1
  end
end
