require 'rails_helper'

RSpec.describe HospitalListsController, type: :controller do
  skip "its like the hospital-list-(just like the doctor-list) should be a join fuck, used somewhere else? investigate!"
  # # This should return the minimal set of attributes required to create a valid
  # # HospitalList. As you add validations to HospitalList, be sure to
  # # adjust the attributes here as well.
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
  # # HospitalListsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "assigns all hospital_lists as @hospital_lists" do
  #     hospital_list = HospitalList.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:hospital_lists)).to eq([hospital_list])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested hospital_list as @hospital_list" do
  #     hospital_list = HospitalList.create! valid_attributes
  #     get :show, {:id => hospital_list.to_param}, valid_session
  #     expect(assigns(:hospital_list)).to eq(hospital_list)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new hospital_list as @hospital_list" do
  #     skip "coming for you soon enough"
  #     get :new, {}, valid_session
  #     expect(assigns(:hospital_list)).to be_a_new(HospitalList)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested hospital_list as @hospital_list" do
  #     hospital_list = HospitalList.create! valid_attributes
  #     get :edit, {:id => hospital_list.to_param}, valid_session
  #     expect(assigns(:hospital_list)).to eq(hospital_list)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new HospitalList" do
  #       expect {
  #         post :create, {:hospital_list => valid_attributes}, valid_session
  #       }.to change(HospitalList, :count).by(1)
  #     end
  #
  #     it "assigns a newly created hospital_list as @hospital_list" do
  #       post :create, {:hospital_list => valid_attributes}, valid_session
  #       expect(assigns(:hospital_list)).to be_a(HospitalList)
  #       expect(assigns(:hospital_list)).to be_persisted
  #     end
  #
  #     it "redirects to the created hospital_list" do
  #       post :create, {:hospital_list => valid_attributes}, valid_session
  #       expect(response).to redirect_to(HospitalList.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved hospital_list as @hospital_list" do
  #       post :create, {:hospital_list => invalid_attributes}, valid_session
  #       expect(assigns(:hospital_list)).to be_a_new(HospitalList)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {:hospital_list => invalid_attributes}, valid_session
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
  #     it "updates the requested hospital_list" do
  #       hospital_list = HospitalList.create! valid_attributes
  #       put :update, {:id => hospital_list.to_param, :hospital_list => new_attributes}, valid_session
  #       hospital_list.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested hospital_list as @hospital_list" do
  #       hospital_list = HospitalList.create! valid_attributes
  #       put :update, {:id => hospital_list.to_param, :hospital_list => valid_attributes}, valid_session
  #       expect(assigns(:hospital_list)).to eq(hospital_list)
  #     end
  #
  #     it "redirects to the hospital_list" do
  #       hospital_list = HospitalList.create! valid_attributes
  #       put :update, {:id => hospital_list.to_param, :hospital_list => valid_attributes}, valid_session
  #       expect(response).to redirect_to(hospital_list)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the hospital_list as @hospital_list" do
  #       hospital_list = HospitalList.create! valid_attributes
  #       put :update, {:id => hospital_list.to_param, :hospital_list => invalid_attributes}, valid_session
  #       expect(assigns(:hospital_list)).to eq(hospital_list)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       hospital_list = HospitalList.create! valid_attributes
  #       put :update, {:id => hospital_list.to_param, :hospital_list => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested hospital_list" do
  #     hospital_list = HospitalList.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => hospital_list.to_param}, valid_session
  #     }.to change(HospitalList, :count).by(-1)
  #   end
  #
  #   it "redirects to the hospital_lists list" do
  #     hospital_list = HospitalList.create! valid_attributes
  #     delete :destroy, {:id => hospital_list.to_param}, valid_session
  #     expect(response).to redirect_to(hospital_lists_url)
  #   end
  # end

end
