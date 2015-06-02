require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe DoctorProfilesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # DoctorProfile. As you add validations to DoctorProfile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DoctorProfilesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all doctor_profiles as @doctor_profiles" do
      doctor_profile = DoctorProfile.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:doctor_profiles)).to eq([doctor_profile])
    end
  end

  describe "GET show" do
    it "assigns the requested doctor_profile as @doctor_profile" do
      doctor_profile = DoctorProfile.create! valid_attributes
      get :show, {:id => doctor_profile.to_param}, valid_session
      expect(assigns(:doctor_profile)).to eq(doctor_profile)
    end
  end

  describe "GET new" do
    it "assigns a new doctor_profile as @doctor_profile" do
      get :new, {}, valid_session
      expect(assigns(:doctor_profile)).to be_a_new(DoctorProfile)
    end
  end

  describe "GET edit" do
    it "assigns the requested doctor_profile as @doctor_profile" do
      doctor_profile = DoctorProfile.create! valid_attributes
      get :edit, {:id => doctor_profile.to_param}, valid_session
      expect(assigns(:doctor_profile)).to eq(doctor_profile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DoctorProfile" do
        expect {
          post :create, {:doctor_profile => valid_attributes}, valid_session
        }.to change(DoctorProfile, :count).by(1)
      end

      it "assigns a newly created doctor_profile as @doctor_profile" do
        post :create, {:doctor_profile => valid_attributes}, valid_session
        expect(assigns(:doctor_profile)).to be_a(DoctorProfile)
        expect(assigns(:doctor_profile)).to be_persisted
      end

      it "redirects to the created doctor_profile" do
        post :create, {:doctor_profile => valid_attributes}, valid_session
        expect(response).to redirect_to(DoctorProfile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved doctor_profile as @doctor_profile" do
        post :create, {:doctor_profile => invalid_attributes}, valid_session
        expect(assigns(:doctor_profile)).to be_a_new(DoctorProfile)
      end

      it "re-renders the 'new' template" do
        post :create, {:doctor_profile => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested doctor_profile" do
        doctor_profile = DoctorProfile.create! valid_attributes
        put :update, {:id => doctor_profile.to_param, :doctor_profile => new_attributes}, valid_session
        doctor_profile.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested doctor_profile as @doctor_profile" do
        doctor_profile = DoctorProfile.create! valid_attributes
        put :update, {:id => doctor_profile.to_param, :doctor_profile => valid_attributes}, valid_session
        expect(assigns(:doctor_profile)).to eq(doctor_profile)
      end

      it "redirects to the doctor_profile" do
        doctor_profile = DoctorProfile.create! valid_attributes
        put :update, {:id => doctor_profile.to_param, :doctor_profile => valid_attributes}, valid_session
        expect(response).to redirect_to(doctor_profile)
      end
    end

    describe "with invalid params" do
      it "assigns the doctor_profile as @doctor_profile" do
        doctor_profile = DoctorProfile.create! valid_attributes
        put :update, {:id => doctor_profile.to_param, :doctor_profile => invalid_attributes}, valid_session
        expect(assigns(:doctor_profile)).to eq(doctor_profile)
      end

      it "re-renders the 'edit' template" do
        doctor_profile = DoctorProfile.create! valid_attributes
        put :update, {:id => doctor_profile.to_param, :doctor_profile => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested doctor_profile" do
      doctor_profile = DoctorProfile.create! valid_attributes
      expect {
        delete :destroy, {:id => doctor_profile.to_param}, valid_session
      }.to change(DoctorProfile, :count).by(-1)
    end

    it "redirects to the doctor_profiles list" do
      doctor_profile = DoctorProfile.create! valid_attributes
      delete :destroy, {:id => doctor_profile.to_param}, valid_session
      expect(response).to redirect_to(doctor_profiles_url)
    end
  end

end
