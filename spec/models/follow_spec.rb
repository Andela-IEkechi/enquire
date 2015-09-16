require 'rails_helper'

RSpec.describe Follow, :type => :model do
  it "has a valid factory" do
    follow = FactoryGirl.build(:follow)
    expect(follow).to be_valid
  end

  context "presence validations" do
    before :all do
      @follow = FactoryGirl.build(:follow, user: nil, question: nil)
      @follow.save
    end

    it "validates the presence of user" do
      expect(@follow.errors[:user]).to be_present
    end

    it "validates the presence of question" do
      expect(@follow.errors[:question]).to be_present
    end

    it "does not save invalid follows" do
      expect{ @follow.save }.to change{ Follow.count }.by 0
    end
  end

  context "validating uniqueness of user on a question" do
    before :all do
      @follow = FactoryGirl.create(:follow)
      @user = @follow.user
      @question = @follow.question
    end

    it "does not allow a person to follow the same question more than once" do
      follow_2 = FactoryGirl.build(:follow, user: @user, question: @question)
      follow_2.save
      expect(follow_2.errors[:user]).to be_present
    end

    it "allows same user to follow multiple questions" do
      follow_2 = FactoryGirl.build(:follow, user: @user)
      expect{ follow_2.save }.to change{ Follow.count }.by 1
      expect(follow_2.errors[:user]).not_to be_present
      expect(@user.follows.count).to be 2
    end

    it "allows a question to be followed by multiple users" do
      follow_2 = FactoryGirl.build(:follow, question: @question)
      expect{ follow_2.save }.to change{ Follow.count }.by 1
      expect(follow_2.errors[:question]).not_to be_present
      expect(@question.users.count).to be 2
    end
  end

end
