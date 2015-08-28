require 'rails_helper'

RSpec.describe DoctorListsController, type: :controller do
 skip "its like the doctor-list should be a join fuck, used somewhere else? investigate!"
  #todo "unfortunately, it is not :("
  # before do
  #   @doc = FactoryGirl.create(:user, :verified_doctor)
  #   @valid_attributes = FactoryGirl.attributes_for(:article, writer: @doc)
  #   @invalid_attributes = FactoryGirl.attributes_for(:article, content: nil)
  #   sign_in @doc
  # end
  #
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # DoctorListsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all doctor_lists as @doctor_lists" do
  #     doctor_list = DoctorList.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:doctor_lists)).to eq([doctor_list])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested doctor_list as @doctor_list" do
  #     doctor_list = DoctorList.create! valid_attributes
  #     get :show, {:id => doctor_list.to_param}, valid_session
  #     expect(assigns(:doctor_list)).to eq(doctor_list)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new doctor_list as @doctor_list" do
  #     get :new, {}, valid_session
  #     expect(assigns(:doctor_list)).to be_a_new(DoctorList)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested doctor_list as @doctor_list" do
  #     doctor_list = DoctorList.create! valid_attributes
  #     get :edit, {:id => doctor_list.to_param}, valid_session
  #     expect(assigns(:doctor_list)).to eq(doctor_list)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new DoctorList" do
  #       expect {
  #         post :create, {:doctor_list => valid_attributes}, valid_session
  #       }.to change(DoctorList, :count).by(1)
  #     end
  #
  #     it "assigns a newly created doctor_list as @doctor_list" do
  #       post :create, {:doctor_list => valid_attributes}, valid_session
  #       expect(assigns(:doctor_list)).to be_a(DoctorList)
  #       expect(assigns(:doctor_list)).to be_persisted
  #     end
  #
  #     it "redirects to the created doctor_list" do
  #       post :create, {:doctor_list => valid_attributes}, valid_session
  #       expect(response).to redirect_to(DoctorList.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved doctor_list as @doctor_list" do
  #       post :create, {:doctor_list => invalid_attributes}, valid_session
  #       expect(assigns(:doctor_list)).to be_a_new(DoctorList)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {:doctor_list => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested doctor_list" do
  #       doctor_list = DoctorList.create! valid_attributes
  #       put :update, {:id => doctor_list.to_param, :doctor_list => new_attributes}, valid_session
  #       doctor_list.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested doctor_list as @doctor_list" do
  #       doctor_list = DoctorList.create! valid_attributes
  #       put :update, {:id => doctor_list.to_param, :doctor_list => valid_attributes}, valid_session
  #       expect(assigns(:doctor_list)).to eq(doctor_list)
  #     end
  #
  #     it "redirects to the doctor_list" do
  #       doctor_list = DoctorList.create! valid_attributes
  #       put :update, {:id => doctor_list.to_param, :doctor_list => valid_attributes}, valid_session
  #       expect(response).to redirect_to(doctor_list)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the doctor_list as @doctor_list" do
  #       doctor_list = DoctorList.create! valid_attributes
  #       put :update, {:id => doctor_list.to_param, :doctor_list => invalid_attributes}, valid_session
  #       expect(assigns(:doctor_list)).to eq(doctor_list)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       doctor_list = DoctorList.create! valid_attributes
  #       put :update, {:id => doctor_list.to_param, :doctor_list => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested doctor_list" do
  #     doctor_list = DoctorList.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => doctor_list.to_param}, valid_session
  #     }.to change(DoctorList, :count).by(-1)
  #   end
  #
  #   it "redirects to the doctor_lists list" do
  #     doctor_list = DoctorList.create! valid_attributes
  #     delete :destroy, {:id => doctor_list.to_param}, valid_session
  #     expect(response).to redirect_to(doctor_lists_url)
  #   end
  # end

end
