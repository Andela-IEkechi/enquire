require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do

  before do
    @manager = FactoryGirl.create(:user, :manager)
    @clients = FactoryGirl.create_list(:user, 2, :client)
    @verified_doctors = FactoryGirl.create_list(:user, 2, :verified_doctor)
    @un_verified_doctors = FactoryGirl.create_list(:user, 2, :un_verified_doctor)
    sign_in @manager
  end

  describe "GET index" do
    before do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assign clients" do
      expect(assigns(:clients)).to eq @clients
    end

    it "assign only verified_doctors as @doctors" do
      expect(assigns(:doctors)).to eq @verified_doctors
    end

    it "assign managers as @managers" do
      expect(assigns(:managers)).to eq [@manager]
    end
  end

  describe "GET show" do
    before do
      @user = FactoryGirl.create(:user, :client)
      get :show, id: @user.to_param
    end

    it "assign User with given id as @profile" do
      expect(assigns(:profile)).to eq @user
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
