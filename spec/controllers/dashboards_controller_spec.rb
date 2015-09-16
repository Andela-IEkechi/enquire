require 'rails_helper'

RSpec.describe DashboardsController, :type => :controller do

  describe "GET show" do
    context 'for manager' do
      before do
        @manager = FactoryGirl.create(:user, :manager)
        @notifications = []
        2.times.each do
          @notifications << FactoryGirl.create(:doctor_verification_request)
        end

        sign_in @manager
        get :show
      end

      it "should assign all the managers notification (DoctorVerificationRequest) as @notifications" do
        expect(assigns(:manager_notifications)).to eq(@notifications)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    context 'for admin' do
      before do
        @admin = FactoryGirl.create(:user, :admin)
        @notifications = []
        2.times.each do
          @notifications << FactoryGirl.create(:hospital_verification_request)
        end

        sign_in @admin
        get :show
      end

      it "should assign all the managers notification (DoctorVerificationRequest) as @notifications" do
        expect(assigns(:admin_notifications)).to eq(@notifications)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

  end

end
