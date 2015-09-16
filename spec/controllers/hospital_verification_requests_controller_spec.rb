require 'rails_helper'

RSpec.describe HospitalVerificationRequestsController, type: :controller do

  before do
    @admin = FactoryGirl.create(:user, :admin)
    @hospital = FactoryGirl.create(:hospital, :un_verified)
    @manager = @hospital.manager
    @valid_attributes = FactoryGirl.attributes_for(:hospital_verification_request, user: @manager, hospital: @hospital)
    @valid_attributes[:hospital_id] = @hospital.id
    @invalid_attributes = FactoryGirl.attributes_for(:hospital_verification_request, user: nil, hospital: nil)
    sign_in @manager
  end

  describe "GET #index" do
    before do
      @hospital_verification_request = HospitalVerificationRequest.create! @valid_attributes
      get :index
    end

    it "assigns all hospital_verification_request as @hospital_verification_requests" do
      expect(assigns(:hospital_verification_requests)).to eq([@hospital_verification_request])
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before do
      @hospital_verification_request = HospitalVerificationRequest.create! @valid_attributes
      get :show, {:id => @hospital_verification_request.to_param}
    end

    it "assigns the requested hospital_verification_request as hospital_verification_request" do
      expect(assigns(:hospital_verification_request)).to eq(@hospital_verification_request)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    before do
      get :new
    end

    it "assigns a new hospital_verification_request as @hospital_verification_request" do
      expect(assigns(:hospital_verification_request)).to be_a_new(HospitalVerificationRequest)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new HospitalVerificationRequest" do
        expect {
          post :create, hospital_verification_request: @valid_attributes
        }.to change(HospitalVerificationRequest, :count).by(1)
      end

      it "assigns a newly created hospital_verification_request as @hospital_verification_request" do
        post :create, {:hospital_verification_request => @valid_attributes}
        expect(assigns(:hospital_verification_request)).to be_a(HospitalVerificationRequest)
        expect(assigns(:hospital_verification_request)).to be_persisted
      end

      it "redirects to dashboard" do
        post :create, {:hospital_verification_request => @valid_attributes}
        expect(response).to redirect_to(dashboard_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved hospital_verification_request as @hospital_verification_request" do
        post :create, {:hospital_verification_request => @invalid_attributes}
        expect(assigns(:hospital_verification_request)).to be_a_new(HospitalVerificationRequest)
      end

      it "re-renders the 'new' template" do
        post :create, {:hospital_verification_request => @invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @request.env['HTTP_REFERER'] = 'where_i_came_from'
    end

    it "destroys the requested hospital_verification_request" do
      hospital_verification_request = HospitalVerificationRequest.create! @valid_attributes
      expect {
        delete :destroy, {:id => hospital_verification_request.to_param}
      }.to change(HospitalVerificationRequest, :count).by(-1)
    end

    it "redirects to the previous page" do
      hospital_verification_request = HospitalVerificationRequest.create! @valid_attributes
      delete :destroy, {:id => hospital_verification_request.to_param}
      expect(response).to redirect_to("where_i_came_from")
    end
  end

end
