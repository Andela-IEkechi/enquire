require 'rails_helper'

RSpec.describe ReviewsController, :type => :controller do

  before do
    @request.env['HTTP_REFERER'] = 'where_i_came_from'
    @client = FactoryGirl.create(:user, :client)
    @valid_attributes = FactoryGirl.attributes_for(:review, user: @client)
    @invalid_attributes = FactoryGirl.attributes_for(:review, hospital: nil, content: nil)

    sign_in @client
  end

  describe "GET index" do
    before do
      @review = Review.create! @valid_attributes
      get :index
    end

    it "assigns all reviews as @reviews" do
      expect(assigns(:reviews)).to eq([@review])
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    before do
      @review = Review.create! @valid_attributes
      get :show, {:id => @review.to_param}
    end

    it "assigns the requested review as @review" do
      expect(assigns(:review)).to eq(@review)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    before do
      get :new
    end

    it "assigns a new review as @review" do
      expect(assigns(:review)).to be_a_new(Review)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    before do
      @review = Review.create! @valid_attributes
      get :edit, {:id => @review.to_param}
    end

    it "assigns the requested review as @review" do
      expect(assigns(:review)).to eq(@review)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    before do
      @hospital = FactoryGirl.create(:hospital, :verified)
      @valid_attributes[:hospital_id] = @hospital.id
    end

    describe "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, {:review => @valid_attributes}
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created review as @review" do
        post :create, {:review => @valid_attributes}
        expect(assigns(:review)).to be_a(Review)
        expect(assigns(:review)).to be_persisted
      end

      it "redirects back to the referring page" do
        post :create, {:review => @valid_attributes}
        expect(response).to redirect_to "where_i_came_from"
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved review as @review" do
        post :create, {:review => @invalid_attributes}
        expect(assigns(:review)).to be_a_new(Review)
      end

      it "re-renders the 'new' template" do
        post :create, {:review => @invalid_attributes}
        expect(response).to render_template("new") #todo should this actually render the new template for review?
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before do
        @review = FactoryGirl.create(:review, user: @client)
        @new_attributes = FactoryGirl.attributes_for(:review, user: @client)

        put :update, {:id => @review.to_param, :review => @new_attributes}
      end

      it "assigns the requested review as @review" do
        expect(assigns(:review)).to eq(@review)
      end

      it "redirects to the review" do
        expect(response).to redirect_to(@review)
      end

      it "updates the requested review" do
        @review.reload
        expect(@review.content).to eq @new_attributes[:content]
      end
    end

    describe "with invalid params" do
      before do
        @review = FactoryGirl.create(:review, user: @client)
        @new_attributes = FactoryGirl.attributes_for(:review, user: @client, hospital: nil, content: nil)

        put :update, {:id => @review.to_param, :review => @new_attributes}
      end

      it "assigns the review as @review" do
        expect(assigns(:review)).to eq(@review)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @review = Review.create! @valid_attributes
    end

    it "destroys the requested review" do
      expect {
        delete :destroy, {:id => @review.to_param}
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      delete :destroy, {:id => @review.to_param}
      expect(response).to redirect_to(reviews_url)
    end
  end

end
