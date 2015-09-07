require 'rails_helper'

RSpec.describe HospitalLikesController, :type => :controller do

  before do
    @request.env['HTTP_REFERER'] = 'where_i_came_from'
    @valid_attributes = FactoryGirl.attributes_for(:hospital_like)
    @client = FactoryGirl.create(:user, :client)
    sign_in @client
  end

  describe "GET new" do
    before do
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should assign a 'recommend' as a new HospitalLike" do
      expect(assigns(:recommend)).to be_a_new(HospitalLike)
    end
  end

  describe "POST create" do
    before do
      @hospital_id = @valid_attributes[:hospital].id
    end

    it "assigns a newly created like as @recommend" do
      post :create, hospital_like: { user_id: @client.id, hospital_id: @hospital_id }
      expect(assigns(:recommend)).to be_a(HospitalLike)
    end

    it "creates a new HospitalLike" do
      expect {
        post :create, hospital_like: { hospital_id: @hospital_id }
      }.to change(HospitalLike, :count).by(1)
    end

    it "should create a new like for the associated hospital" do
      expect {
        post :create, hospital_like: { hospital_id: @hospital_id }
      }.to change(@valid_attributes[:hospital].hospital_likes, :count).by(1)
    end

    it "should associate the new recommendation with the current_user liking the hospital" do
      expect {
        post :create, hospital_like: { hospital_id: @hospital_id }
      }.to change(@client.hospital_likes, :count).by(1)
    end

    it "redirects back to the referring page" do
      post :create, hospital_like: { hospital_id: @hospital_id }
      expect(response).to redirect_to "where_i_came_from"
    end
  end

  describe "DELETE destroy" do
    before do
      @like = FactoryGirl.create(:hospital_like)
    end

    it "destroys the requested like" do
      expect {
        delete :destroy, {:id => @like.to_param}
      }.to change(HospitalLike, :count).by(-1)
    end

    it "redirects back to the referring page" do
      delete :destroy, {:id => @like.to_param}
      expect(response).to redirect_to "where_i_came_from"
    end
  end
end