require 'rails_helper'

RSpec.describe DoctorListsController, type: :controller do

  before do
    @manager = FactoryGirl.create(:user, :manager)
    @hospital = FactoryGirl.create(:hospital, :verified, manager: @manager)
    @verified_doctor = FactoryGirl.create(:user, :verified_doctor)
    @valid_attributes = {user_id: @verified_doctor.id, hospital_id: @hospital.id}
    # @valid_attributes[:user_id] =
    @invalid_attributes = FactoryGirl.attributes_for(:doctor_list, hospital: nil)
    sign_in @manager
  end

  describe "GET #index" do
    before do
      @doctor_list = FactoryGirl.create(:doctor_list, hospital: @hospital)
      get :index
    end

    it "assigns all doctor_lists for doctors belonging to signed in manager as @doctor_lists" do
      expect(assigns(:doctor_lists)).to eq([@doctor_list])
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #show" do
  #   before do
  #     @doctor_list = DoctorList.create! @valid_attributes
  #     get :show, {:id => @doctor_list.to_param}
  #   end
  #
  #   it "assigns the requested doctor_list as @doctor_list" do
  #     expect(assigns(:doctor_list)).to eq(@doctor_list)
  #   end
  #
  #   it "returns http success" do
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #new" do
    before do
      get :new
    end
    it "assigns a new doctor_list as @doctor_list" do
      expect(assigns(:doctor_list)).to be_a_new(DoctorList)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #edit" do
  #   before do
  #     @doctor_list = DoctorList.create! @valid_attributes
  #     get :edit, {:id => @doctor_list.to_param}
  #   end
  #
  #   it "assigns the requested doctor_list as @doctor_list" do
  #     expect(assigns(:doctor_list)).to eq(@doctor_list)
  #   end
  #
  #   it "returns http success" do
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DoctorList" do
        expect {
          post :create, {:doctor_list => @valid_attributes}
        }.to change(DoctorList, :count).by(1)
      end

      it "assigns a newly created doctor_list as @doctor_list" do
        post :create, {:doctor_list => @valid_attributes}
        expect(assigns(:doctor_list)).to be_a(DoctorList)
        expect(assigns(:doctor_list)).to be_persisted
      end

      it "redirects to the created doctor_list" do
        post :create, {:doctor_list => @valid_attributes}
        expect(response).to redirect_to(DoctorList.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved doctor_list as @doctor_list" do
        post :create, {:doctor_list => @invalid_attributes}
        expect(assigns(:doctor_list)).to be_a_new(DoctorList)
      end

      it "re-renders the 'new' template" do
        post :create, {:doctor_list => @invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested doctor_list" do
      doctor_list = DoctorList.create! @valid_attributes
      expect {
        delete :destroy, {:id => doctor_list.to_param}
      }.to change(DoctorList, :count).by(-1)
    end

    it "redirects to the doctor_lists list" do
      doctor_list = DoctorList.create! @valid_attributes
      delete :destroy, {:id => doctor_list.to_param}
      expect(response).to redirect_to(doctor_lists_url)
    end
  end

end
