require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it "has a valid factory" do
    answer = FactoryGirl.build(:answer)
    expect(answer).to be_valid
  end

  context "validation" do
    describe "invalid answer" do
      before :all do
        @answer = FactoryGirl.build(:answer, content: nil, question: nil, user: nil)
        @answer.save
      end
      it "validates presence of content" do
        expect(@answer.errors[:content]).to be_present
      end

      it "validates presence of question" do
        expect(@answer.errors[:question]).to be_present
      end

      it "validates presence of user" do
        expect(@answer.errors[:user]).to be_present
      end
    end

    it "saves a valid answer" do
      expect{FactoryGirl.create(:answer)}.to change{Answer.count}.by 1
    end
  end

  context "relationships" do
    it "has many likes" do
      user = FactoryGirl.create(:user, :client)
      user2 = FactoryGirl.create(:user, :client)
      answer = FactoryGirl.create(:answer)
      AnswerLike.create(user: user, answer: answer)
      expect{ AnswerLike.create(user: user2, answer: answer) }.to change{ answer.answer_likes.count }.by 1
      expect(answer.answer_likes.count).to eq 2
    end
  end
end
