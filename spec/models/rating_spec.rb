require 'rails_helper'

RSpec.describe Rating, type: :model do
  it 'should have a valid factory do' do
    rating = FactoryGirl.build(:rating)
    expect(rating).to be_valid
  end

  context 'validations for presence' do
    before :all do
      @rating = FactoryGirl.build(:rating, score: nil, article: nil, user: nil)
      @rating.save
    end

    it "should throw error for records with no score" do
      expect(@rating.errors[:score]).to be_present
    end

    it "should throw error for records not associated with any article" do
      expect(@rating.errors[:article]).to be_present
    end

    it "should throw error for records not associated with any user" do
      expect(@rating.errors[:user]).to be_present
    end
  end

  it 'should save a valid record' do
    expect { FactoryGirl.create(:rating) }.to change { Rating.count }.by 1
  end
  
  context 'validation for uniqueness' do
    before do
      @rating = FactoryGirl.create(:rating)
      @user = @rating.user
      @article = @rating.article
    end

    it 'should not allow the creation of more than one rating for an article per user' do
      rating_2 = FactoryGirl.build(:rating, user: @user, article: @article)
      expect{ rating_2.save }.not_to change{ Rating.count }
    end
  end

  context '#update_rating_if_already_exists' do
    it "should return false for user rating same article again" do
      rating = FactoryGirl.create(:rating)
      rating_2 = FactoryGirl.build(:rating, user: rating.user, article: rating.article)
      expect(rating_2.update_rating_if_already_exists).to be_falsey
    end

    it "should only update the rating score for user trying to rate same article again" do
      rating = FactoryGirl.create(:rating)
      rating_2 = FactoryGirl.build(:rating, user: rating.user, article: rating.article)
      expect{ rating_2.save }.to change{ Rating.first.score }.to rating_2.score
    end

    it "should return true for user rating article for first time" do
      rating = FactoryGirl.build(:rating)
      expect(rating.update_rating_if_already_exists).to be_truthy
    end
  end
end
