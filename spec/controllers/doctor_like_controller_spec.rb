require 'rails_helper'

RSpec.describe DoctorLikesController, :type => :controller do

  before do
    @request.env['HTTP_REFERER'] = 'where_i_came_from'
    @valid_attributes = FactoryGirl.attributes_for(:doctor_like)
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

    it "should assign a 'like_doctor' as a new DoctorLike" do
      expect(assigns(:like_doctor)).to be_a_new(DoctorLike)
    end
  end

  describe "POST create" do
    before do
      @user_id = @valid_attributes[:user].id
    end

    it "assigns a newly created like as @doctor_like" do
      post :create, doctor_like: { doctor: nil }
      expect(assigns(:doctor_like)).to be_a(DoctorLike)
    end

    it "creates a new DoctorLike" do
      expect {
        post :create, doctor_like: { doctor: nil }
      }.to change(DoctorLike, :count).by(1)
    end

    it "should create a new like for the associated doctor" do
      skip "the like is yet to be linked to the doctor"
      expect {
        post :create, doctor_like: { doctor: @doctor_id }
      }.to change(@valid_attributes[:doctor].likes, :count).by(1)
    end

    it "should associate the new like with the current_user liking the doctor" do
      expect {
        post :create, doctor_like: { doctor: nil }
      }.to change(@client.doctor_likes, :count).by(1)
    end

    it "redirects back to the referring page" do
      post :create, doctor_like: { user_id:@user_id }
      expect(response).to redirect_to "where_i_came_from"
    end
  end

  describe "DELETE destroy" do
    before do
      @like = FactoryGirl.create(:doctor_like)
    end

    it "destroys the requested like" do
      expect {
        delete :destroy, {:id => @like.to_param}
      }.to change(DoctorLike, :count).by(-1)
    end

    it "redirects back to the referring page" do
      delete :destroy, {:id => @like.to_param}
      expect(response).to redirect_to "where_i_came_from"
    end
  end
end