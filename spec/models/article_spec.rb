require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'should have a valid factory' do
    article = FactoryGirl.build(:article)
    expect(article).to be_valid
  end

  context 'validations' do
    before :all do
      @article = FactoryGirl.build(:article, doctor: nil, title: nil, content: nil)
      @article.save
    end

    it "should ensure that error is thrown for a record with empty user(doctor)" do
      expect(@article.errors[:doctor]).to be_present
    end

    it "should ensure that error is thrown for a record with empty title" do
      expect(@article.errors[:title]).to be_present
    end

    it "should ensure that error is thrown for a record with empty content" do
      expect(@article.errors[:content]).to be_present
    end
  end

  context 'doc_is_a_verified_doctor' do
    it "should throw error when user is a client" do
      client = FactoryGirl.create(:user, :client)
      article = FactoryGirl.build(:article, doctor: client)
      expect{ article.save }.not_to change{ Article.count }
      expect(article.errors[:user]).to be_present
    end

    it "should throw error when user is a manager" do
      manager = FactoryGirl.create(:user, :manager)
      article = FactoryGirl.build(:article, doctor: manager)
      expect{ article.save }.not_to change{ Article.count }
      expect(article.errors[:user]).to be_present
    end
  end

  it 'should save a valid record' do
    expect{ FactoryGirl.create(:article) }.to change{ Article.count }.by 1
  end

  context 'relationship' do
    before do
      @article = FactoryGirl.create(:article)
      @rating = FactoryGirl.create(:rating, article: @article)
    end

    it "should allow an article to have multiple ratings" do
      expect{ FactoryGirl.create(:rating, article: @article) }.to change{ Rating.count }.by 1
      expect(@article.ratings.size).to eq 2
    end

    it "should destroy all associated ratings of an article on deleting the article" do
      num_of_ratings = @article.ratings.size
      expect{ @article.destroy }.to change{ Rating.count }.by (0 - num_of_ratings)
    end
  end

  context '#average_rating' do
    it "should get the average of all the ratings of an article" do
      article = FactoryGirl.create(:article)
      rattings = []
      5.times.each do
        rattings << FactoryGirl.create(:rating, article: article)
      end
      scores = rattings.map{ |ratting| ratting.score }

      expect(article.average_rating).to eq (scores.inject{|sum,x| sum + x } / scores.size)
    end
  end
end
