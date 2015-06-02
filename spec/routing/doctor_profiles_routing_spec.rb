require "rails_helper"

RSpec.describe DoctorProfilesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/doctor_profiles").to route_to("doctor_profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/doctor_profiles/new").to route_to("doctor_profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/doctor_profiles/1").to route_to("doctor_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/doctor_profiles/1/edit").to route_to("doctor_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/doctor_profiles").to route_to("doctor_profiles#create")
    end

    it "routes to #update" do
      expect(:put => "/doctor_profiles/1").to route_to("doctor_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/doctor_profiles/1").to route_to("doctor_profiles#destroy", :id => "1")
    end

  end
end
