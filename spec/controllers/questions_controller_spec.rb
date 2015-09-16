require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  before do
    @client = FactoryGirl.create(:user, :client)
    @valid_attributes = FactoryGirl.attributes_for(:question)
    @invalid_attributes = FactoryGirl.attributes_for(:hospital, body: nil, user: nil)
    sign_in @client
  end

  describe "GET index" do
    before do
      @my_questions = FactoryGirl.create_list(:question, 2, user: @client)
      to_follow = FactoryGirl.create_list(:follow, 2, user: @client)
      @my_follows = to_follow.map(&:question)
      @question = Question.create! @valid_attributes
      @questions = @my_questions + @my_follows + [@question]
      get :index
    end

    it "assigns all questions in reverse order as @questions when no query params is specified" do
      expect(assigns(:questions)).to eq(@questions.reverse)
    end

    it "assigns all questions followed by current_user in descending order, as @follows" do
      expect(assigns(:my_follows)).to eq @my_follows.reverse
    end

    it "assigns all questions created by signed in user (in reverse order) as @my_questions" do
      expect(assigns(:my_questions)).to eq @my_questions.reverse
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index, with qeary params" do
    it "assigns all question with kind of specified param as @question, when there is a query param" do
      all_questions = FactoryGirl.create_list(:question, 5)
      to_get = all_questions[2]
      get :index, q: to_get.body
      expect(assigns(:questions)).to eq([to_get])
    end
  end

  describe "GET show" do
    before do
      @question = Question.create! @valid_attributes
      @answers = FactoryGirl.create_list(:answer, 2, question: @question)
      FactoryGirl.create_list(:question, 2)
      FactoryGirl.create_list(:answer, 2)

      get :show, {:id => @question.to_param}
    end

    it "assigns the requested question as @question" do
      expect(assigns(:question)).to eq(@question)
    end

    it "should assign the answers of the requested question (in descending order), as @answers" do
      expect(assigns(:answers)).to eq(@answers.reverse)
    end

    it "should assign a new answer for the selected question as @answer" do
      expect(assigns(:answer)).to be_a_new(Answer)
      expect(assigns(:answer).question).to eq @question
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    before do
      get :new
    end

    it "assigns a new question as @question" do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    before do
      @question = Question.create! @valid_attributes
      @question.update_attribute(:user, @client)
      get :edit, {:id => @question.to_param}
    end

    it "assigns the requested question as @question (only works for question owners)" do
      expect(assigns(:question)).to eq(@question)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, {:question => @valid_attributes}
        }.to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {:question => @valid_attributes}
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to be_persisted
      end

      it "redirects to the created question" do
        post :create, {:question => @valid_attributes}
        expect(response).to redirect_to(Question.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        post :create, {:question => @invalid_attributes}
        expect(assigns(:question)).to be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        post :create, {:question => @invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before do
        @question = Question.create! @valid_attributes
        @question.update_attribute(:user, @client)
        @new_attributes = FactoryGirl.attributes_for(:question, user: @client)

        put :update, {:id => @question.to_param, :question => @new_attributes}
      end

      it "assigns the requested question as @question" do
        expect(assigns(:question)).to eq(@question)
      end

      it "redirects to the question" do
        expect(response).to redirect_to(@question)
      end

      it "updates the requested question" do
        @question.reload
        expect(@question.body).to eq @new_attributes[:body]
      end
    end

    describe "with invalid params" do
      before do
        @question = Question.create! @valid_attributes
        @question.update_attribute(:user, @client)
        @new_attributes = FactoryGirl.attributes_for(:question, user: @client, body: nil)

        put :update, {:id => @question.to_param, :question => @new_attributes}
      end

      it "assigns the question as @question" do
        expect(assigns(:question)).to eq(@question)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @question = Question.create! @valid_attributes
    end

    it "destroys the requested question" do
      expect {
        delete :destroy, {:id => @question.to_param}
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      delete :destroy, {:id => @question.to_param}
      expect(response).to redirect_to(questions_url)
    end
  end

  describe "GET answer" do
    before do
      sign_out @client
      @doc = FactoryGirl.create(:user, :verified_doctor)
      sign_in @doc
      @question = Question.create! @valid_attributes
    end

    context "with valid attributes" do
      before do
        @new_answer = FactoryGirl.attributes_for(:answer, user: @doc)
        @count = Answer.count
        post :answer, answer: @new_answer, id: @question.to_param
      end

      it "should assign specified question as @question" do
        expect(assigns(:question)).to eq @question
      end

      it "assigns @answer as a new Answer" do
        expect(assigns(:answer)).to be_a(Answer)
      end

      it "assigns that question is being answered by signed in user" do
        expect(assigns(:answer).question).to eq @question
        expect(assigns(:answer).user).to eq @doc
      end

      it "should create a new answer" do
        expect(Answer.count). to eq @count + 1
      end

      it "redirects to the question" do
        expect(response).to redirect_to(@question)
      end
    end

    context "with invalid attributes" do
      before do
        @new_answer = FactoryGirl.attributes_for(:answer, user: @doc, content: nil)

        post :answer, answer: @new_answer, id: @question.to_param
      end

      it "should assign specified question as @question" do
        expect(assigns(:question)).to eq @question
      end

      it "assigns @answer as a new Answer" do
        expect(assigns(:answer)).to be_a(Answer)
      end

      it "assigns that question is being answered by signed in user" do
        expect(assigns(:answer).question).to eq @question
        expect(assigns(:answer).user).to eq @doc
      end

      it "re-renders the 'show' template" do
        expect(response).to render_template("show")
      end
    end
  end

end
