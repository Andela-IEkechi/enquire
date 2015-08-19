require 'rails_helper'

RSpec.describe Question, :type => :model do
  it 'should have a valid factory' do
    question = FactoryGirl.build(:question)
    expect(question).to be_valid
  end

  context 'validations' do
    before :all do
      @question = FactoryGirl.build(:question, body: nil, user: nil)
      @question.save
    end

    it "should throw error when question is blank" do
      expect(@question.errors[:body]).to be_present
    end

    it "should throw error when user is blank" do
      expect(@question.errors[:user]).to be_present
    end
  end

  context 'other stuffs to test' do
    it "should accept nested attributes for answer" do
      skip "test acceptance of nested attributes for answer"
    end
  end

  context 'validating type of user' do
    it "should throw error when user is a doctor" do
      doc = FactoryGirl.create(:user, :doctor)
      question = FactoryGirl.build(:question, user: doc)
      expect{ question.save }.not_to change{ Question.count }
      expect(question.errors[:user]).to be_present
    end

    it "should throw error when user is a manager" do
      manager = FactoryGirl.create(:user, :manager)
      question = FactoryGirl.build(:question, user: manager)
      expect{ question.save }.not_to change{ Question.count }
      expect(question.errors[:user]).to be_present
    end
  end

  context '#all_tags' do
    it 'should create a new tag for tags that are not pre-existing.' do
      question = FactoryGirl.build(:question, all_tags: "eyes, nose, mouth")
      expect{ question.save }.to change{ Tag.count }.by 3
    end

    it 'should not create a new tag for tags that are pre-existing.' do
      question = FactoryGirl.build(:question, all_tags: "eyes, nose, lips")
      expect{ question.save }.to change{ Tag.count }.by 1
    end

    it 'should get and return all matching tags of a question' do
      question = FactoryGirl.create(:question, all_tags: "eyes, nose, mouth, lips, espitus")
      expect{ question.all_tags }.to eq  "eyes, nose, mouth, lips, espitus"
    end
  end
end
