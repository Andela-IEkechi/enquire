require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'should have a valid factory' do
    article = FactoryGirl.build(:article)
    expect(article).to be_valid
  end

  context 'validations' do
    before :all do
      @article = FactoryGirl.build(:article, writer: nil, title: nil, content: nil)
      @article.save
    end

    it "should ensure that error is thrown for a record with empty user(doctor)" do
      expect(@article.errors[:writer]).to be_present
    end

    it "should ensure that error is thrown for a record with empty title" do
      expect(@article.errors[:title]).to be_present
    end

    it "should ensure that error is thrown for a record with empty content" do
      expect(@article.errors[:content]).to be_present
    end
  end

  context 'doc_is_a_verified_doctor' do
    it "should throw error when writer is a client" do
      client = FactoryGirl.create(:user, :client)
      article = FactoryGirl.build(:article, writer: client)
      expect{ article.save }.not_to change{ Article.count }
      expect(article.errors[:writer]).to be_present
    end

    it "should throw error when writer is a manager" do
      manager = FactoryGirl.create(:user, :manager)
      article = FactoryGirl.build(:article, writer: manager)
      expect{ article.save }.not_to change{ Article.count }
      expect(article.errors[:writer]).to be_present
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

  context '#user_rating' do
    before do
      @article = FactoryGirl.create(:article)
    end

    it "should get the articles rating by the current user" do
      client = FactoryGirl.create(:user, :client)
      3.times.each do
        FactoryGirl.create(:rating, article: @article)
      end
      rating = FactoryGirl.create(:rating, article: @article, user: client)
      2.times.each do
        FactoryGirl.create(:rating, article: @article)
      end

      expect(@article.user_rating(client)).to eq rating
    end

    it "should create a new rating for new users" do
      client = FactoryGirl.create(:user, :client)
      id = Rating.last ?  Rating.last.id + 1 : 1
      expected = {"user_id" => client.id, "article_id" => @article.id, "score" => 0}
      user_rating = @article.user_rating(client).attributes.slice('user_id', 'article_id', 'score')

      expect(user_rating).to eq expected
    end
  end
end
