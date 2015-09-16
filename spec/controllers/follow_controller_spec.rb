require 'rails_helper'

RSpec.describe FollowsController, :type => :controller do

  before do
    @client = FactoryGirl.create(:user, :client)
    sign_in @client
  end

  describe "GET new" do
    before do
      skip "how is a new follow being collated?"
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assign follow as a new follow record" do
      expect(assigns(:follow)).to be_a_new(Follow)
    end
  end

  describe "POST #create" do
    before do
      @request.env['HTTP_REFERER'] = 'where_i_came_from'
    end

    context "with valid params" do
      before do
        @attributes = FactoryGirl.attributes_for(:follow)
        @valid_attributes = {
          question_id: @attributes[:question].id,
          user_id: @attributes[:user].id
        }
      end

      it "creates a new Follow" do
        expect {
          post :create, :follow => @valid_attributes
        }.to change(Follow, :count).by(1)
      end

      it "creates a new Follow for the associated question" do
        question = @attributes[:question]
        expect {
          post :create, :follow => @valid_attributes
        }.to change(question.follows, :count).by(1)
      end

      it "assigns a newly created follow as @follow" do
        post :create, {:follow => @valid_attributes}
        expect(assigns(:follow)).to be_a(Follow)
        expect(assigns(:follow)).to be_persisted
      end

      it "redirects back to previous page" do
        post :create, {:follow => @valid_attributes}
        expect(response).to redirect_to 'where_i_came_from'
      end
    end

    context "with invalid params" do
      before do
        @invalid_attributes = FactoryGirl.attributes_for(:follow, question: nil)
      end

      it "assigns a newly created but unsaved follow as @follow" do
        post :create, {:follow => @invalid_attributes}
        expect(assigns(:follow)).to be_a_new(Follow)
      end

      it "redirects back to previous page" do
        post :create, {:follow => @invalid_attributes}
        expect(response).to redirect_to 'where_i_came_from'
      end
    end
  end



  describe "DELETE destroy" do
    before :each do
      skip "why cant we destroy a follow / un-follow a question?"
      @follow = FactoryGirl.create(:follow)
      # @count = Follow.count
      delete :destroy, :id => @follow.to_param
    end

    it "assign follow" do
      expect(assigns(:follow)).to eq @follow
    end

    it "should remove the follow from the associated question" do
      expect(@follow.question.follows.count).to change_by -1
    end

    it "should destroy the follow from record" do
      expect(Follow.count).to change_by -1
    end

    it "redirects to the question" do
      expect(response).to redirect_to(@follow.question)
    end
  end
end
