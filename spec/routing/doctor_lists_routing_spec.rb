require "rails_helper"

RSpec.describe DoctorListsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/doctor_lists").to route_to("doctor_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/doctor_lists/new").to route_to("doctor_lists#new")
    end

    it "does not routes to #show" do
      expect(:get => "/doctor_lists/1").not_to be_routable
    end

    it "does not routes to #edit" do
      expect(:get => "/doctor_lists/1/edit").not_to be_routable
    end

    it "routes to #create" do
      expect(:post => "/doctor_lists").to route_to("doctor_lists#create")
    end

    it "does not routes to #update" do
      expect(:put => "/doctor_lists/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/doctor_lists/1").to route_to("doctor_lists#destroy", :id => "1")
    end

  end
end
