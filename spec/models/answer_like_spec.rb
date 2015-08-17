require 'rails_helper'

RSpec.describe AnswerLike, :type => :model do
  context "validation" do
    before :all do
      @answer = FactoryGirl.create(:answer)
      @client = FactoryGirl.create(:user, :client)
      @like = AnswerLike.new
      @like.save
    end
    it "validates presence of answer" do
      expect(@like.errors[:answer]).to be_present
    end

    it "validates presence of user" do
      expect(@like.errors[:user]).to be_present
    end

    it "validates user is a 'client'" do
      doc = FactoryGirl.create(:user, :doctor)
      like = AnswerLike.new(user: doc, answer: @answer)
      like.save
      expect(like.errors[:user]).to be_present
    end

    it "saves valid likes" do
      expect{AnswerLike.create(user: @client, answer: @answer)}.to change{AnswerLike.count}.by 1
    end

    it "has unique user ids..." do
      expect{AnswerLike.create(user: @client, answer: @answer)}.to change{AnswerLike.count}.by 1
      like_duplicate = AnswerLike.new(user: @client, answer: @answer)
      like_duplicate.save
      expect(like_duplicate.errors[:user]).to be_present
    end
  end
end
