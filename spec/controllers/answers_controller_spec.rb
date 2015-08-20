require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do

  before do
    @client = FactoryGirl.create(:user, :doctor)
    sign_in @client
  end

  describe "GET index" do
    before do
      @answer = FactoryGirl.create(:answer)
      get :index, :question => @answer.question
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assign question" do
      expect(assigns(:question)).to eq @answer.question
    end

    it "assign answers" do
      question = @answer.question
      FactoryGirl.create(:answer, question: question)
      expect(assigns(:answers)).to eq question.answers
    end
  end

  describe "GET new" do
    before do
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assign answer as a new record" do
      expect(assigns(:answer)).to be_new_record
    end

    it "assign answer as a new answer" do
      expect(assigns(:answer).kind_of?(Answer)).to be_truthy
    end
  end

  describe "GET edit" do
    before do
      @answer = FactoryGirl.create(:answer)
      get :edit, :id => @answer
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assign question" do
      expect(assigns(:answer)).to eq @answer
    end
  end

  describe "PUT update" do
    before :each do
      @answer = FactoryGirl.create(:answer)
      @new_attr = FactoryGirl.attributes_for(:answer)
      put :update, :id => @answer, :answer => @new_attr
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assign answer" do
      expect(assigns(:answer)).to eq @answer
    end

    it "should update record with params answer" do
      expect(Answer.last.content).to eq @new_attr[:content]
    end
  end

  describe "DELETE destroy" do
    before :each do
      @answer = FactoryGirl.create(:answer)
      @count = Answer.count
      delete :destroy, :id => @answer
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assign answer" do
      expect(assigns(:answer)).to eq @answer
    end

    it "should destroy record with params answer" do
      expect(Answer.count).to eq @count - 1
    end
  end
end
