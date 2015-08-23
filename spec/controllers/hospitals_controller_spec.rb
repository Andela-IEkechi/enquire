require 'rails_helper'

RSpec.describe HospitalsController, :type => :controller do

  before do
    @manager = FactoryGirl.create(:user, :manager)
    @verified_valid_attributes = FactoryGirl.attributes_for(:hospital, :verified, manager: @manager)
    @un_verified_valid_attributes = FactoryGirl.attributes_for(:hospital, :un_verified, manager: @manager)
    @invalid_attributes = FactoryGirl.attributes_for(:hospital, manager: nil, name: nil, address: nil)
    sign_in @manager
  end

  describe "GET index" do
    before do
      FactoryGirl.create_list(:hospital, 2, :un_verified)
      @some_verified_hospital = FactoryGirl.create(:hospital, :verified)
      @mine_hospital = FactoryGirl.create(:hospital, :verified, manager: @manager)
      @verified_hospitals = [@some_verified_hospital] + [@mine_hospital]
      get :index
    end

    it "assigns only the verified hospitals of the signed in manager as @mine_hospitals" do
      expect(assigns(:mine_hospitals)).to eq([@mine_hospital])
    end

    it "assigns only the verified hospitals as @hospitals" do
      expect(assigns(:hospitals)).to eq(@verified_hospitals)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    before do
      @hospital = Hospital.create! @verified_valid_attributes
      FactoryGirl.create_list(:review, 2)
      @reviews = FactoryGirl.create(:review, hospital: @hospital)
      get :show, {:id => @hospital.to_param}
    end

    it "assigns the requested hospital as @hospital" do
      expect(assigns(:hospital)).to eq(@hospital)
    end

    it "assigns all of the requested hospital's reviews as @reviews" do
      expect(assigns(:reviews)).to eq([@reviews])
    end

    it "assigns the requested hospital's recommendations as @recommendation" do
      skip "how are recommendations collated?"
      expect(assigns(:recommendation)).to eq(@recommendation)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    before do
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns a new hospital as @hospital" do
      expect(assigns(:hospital)).to be_a_new(Hospital)
    end
  end

  describe "GET edit" do
    before do
      @hospital = Hospital.create! @verified_valid_attributes
      get :edit, {:id => @hospital.to_param}
    end

    it "assigns the requested hospital as @hospital" do
      expect(assigns(:hospital)).to eq(@hospital)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Hospital" do
        expect {
          post :create, {:hospital => @un_verified_valid_attributes}
        }.to change(Hospital, :count).by(1)
      end

      it "assigns a newly created hospital as @hospital" do
        post :create, {:hospital => @un_verified_valid_attributes}
        expect(assigns(:hospital)).to be_a(Hospital)
        expect(assigns(:hospital)).to be_persisted
      end

      it "redirects to the created hospital" do
        post :create, {:hospital => @un_verified_valid_attributes}
        expect(response).to redirect_to(Hospital.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved hospital as @hospital" do
        post :create, {:hospital => @invalid_attributes}
        expect(assigns(:hospital)).to be_a_new(Hospital)
      end

      it "re-renders the 'new' template" do
        post :create, {:hospital => @invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do
        @hospital = Hospital.create! @un_verified_valid_attributes
        @new_attr = FactoryGirl.attributes_for(:hospital, :verified, manager: @manager)
        put :update, :id => @hospital, :hospital => @new_attr
      end

      it "assigns the requested hospital as @hospital" do
        expect(assigns(:hospital)).to eq(@hospital)
      end

      it "updates the requested hospital" do
        @hospital.reload
        expect(@hospital.description).to eq @new_attr[:description]
      end

      it "redirects to the hospital" do
        expect(response).to redirect_to(@hospital)
      end
    end

    describe "with invalid params" do
      before :each do
        @hospital = Hospital.create! @verified_valid_attributes
        @new_attr = FactoryGirl.attributes_for(:hospital, :verified, manager: @manager, name: nil, description: nil)
        put :update, :id => @hospital, :hospital => @new_attr
      end

      it "assigns the hospital as @hospital" do
        expect(assigns(:hospital)).to eq(@hospital)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @hospital = Hospital.create! @verified_valid_attributes
    end

    it "destroys the requested hospital" do
      expect {
        delete :destroy, {:id => @hospital.to_param}
      }.to change(Hospital, :count).by(-1)
    end

    it "redirects to the hospitals list" do
      delete :destroy, {:id => @hospital.to_param}
      expect(response).to redirect_to(hospitals_url)
    end
  end

  describe "GET #our_doctors" do
    before do
      sign_out @manager
      @client = FactoryGirl.create(:user, :client)
      sign_in @client
      @hospital = Hospital.create! @verified_valid_attributes
      FactoryGirl.create_list(:doctor_list, 2)
      @doctor_list = FactoryGirl.create_list(:doctor_list, 2, hospital: @hospital)
      @doctors = @doctor_list.map(&:user)
      get :our_doctors, id: @hospital.to_param
    end

    it "should assign all doctors registered under specified hospital as @doctors" do
      expect(assigns :doctors).to eq @doctors
    end

    it "assigns the specified hospital as @hospital" do
      expect(assigns(:hospital)).to eq(@hospital)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
