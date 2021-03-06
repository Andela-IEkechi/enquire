require "rails_helper"

RSpec.describe HospitalVerificationRequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hospital_verification_requests").to route_to("hospital_verification_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/hospital_verification_requests/new").to route_to("hospital_verification_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/hospital_verification_requests/1").to route_to("hospital_verification_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hospital_verification_requests/1/edit").to route_to("hospital_verification_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hospital_verification_requests").to route_to("hospital_verification_requests#create")
    end

    it "routes to #update" do
      expect(:put => "/hospital_verification_requests/1").to route_to("hospital_verification_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hospital_verification_requests/1").to route_to("hospital_verification_requests#destroy", :id => "1")
    end

  end
end
