require 'rails_helper'

RSpec.describe DoctorVerificationRequestsController, type: :controller do

  before do
    @hospital = FactoryGirl.create(:hospital, :verified)
    @doc = FactoryGirl.create(:user, :un_verified_doctor)
    @valid_attributes = FactoryGirl.attributes_for(:doctor_verification_request, user: @doc)
    @valid_attributes[:hospital_id] = @hospital.id
    @invalid_attributes = FactoryGirl.attributes_for(:doctor_verification_request, user: nil, hospital: nil)
    sign_in @doc
  end

  describe "GET #index" do
    before do
      @doctor_verification_request = DoctorVerificationRequest.create! @valid_attributes
      get :index
    end

    it "assigns all doctor_verification_requests as @doctor_verification_requests" do
      expect(assigns(:doctor_verification_requests)).to eq([@doctor_verification_request])
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before do
      @doctor_verification_request = DoctorVerificationRequest.create! @valid_attributes
      get :show, {:id => @doctor_verification_request.to_param}
    end

    it "assigns the requested doctor_verification_request as @doctor_verification_request" do
      expect(assigns(:doctor_verification_request)).to eq(@doctor_verification_request)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    before do
      get :new
    end

    it "assigns a new doctor_verification_request as @doctor_verification_request" do
      expect(assigns(:doctor_verification_request)).to be_a_new(DoctorVerificationRequest)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DoctorVerificationRequest" do
        expect {
          post :create, {:doctor_verification_request => @valid_attributes}
        }.to change(DoctorVerificationRequest, :count).by(1)
      end

      it "assigns a newly created doctor_verification_request as @doctor_verification_request" do
        post :create, {:doctor_verification_request => @valid_attributes}
        expect(assigns(:doctor_verification_request)).to be_a(DoctorVerificationRequest)
        expect(assigns(:doctor_verification_request)).to be_persisted
      end

      it "redirects to the dashboard" do
        post :create, {:doctor_verification_request => @valid_attributes}
        expect(response).to redirect_to(dashboard_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved doctor_verification_request as @doctor_verification_request" do
        post :create, {:doctor_verification_request => @invalid_attributes}
        expect(assigns(:doctor_verification_request)).to be_a_new(DoctorVerificationRequest)
      end

      it "re-renders the 'new' template" do
        post :create, {:doctor_verification_request => @invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @request.env['HTTP_REFERER'] = 'where_i_came_from'
    end

    it "destroys the requested doctor_verification_request" do
      doctor_verification_request = DoctorVerificationRequest.create! @valid_attributes
      expect {
        delete :destroy, {:id => doctor_verification_request.to_param}
      }.to change(DoctorVerificationRequest, :count).by(-1)
    end

    it "redirects to the previous page" do
      doctor_verification_request = DoctorVerificationRequest.create! @valid_attributes
      delete :destroy, {:id => doctor_verification_request.to_param}
      expect(response).to redirect_to('where_i_came_from')
    end
  end

end
