require "rails_helper"

RSpec.describe DoctorListsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/doctor_lists").to route_to("doctor_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/doctor_lists/new").to route_to("doctor_lists#new")
    end

    it "routes to #show" do
      expect(:get => "/doctor_lists/1").to route_to("doctor_lists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/doctor_lists/1/edit").to route_to("doctor_lists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/doctor_lists").to route_to("doctor_lists#create")
    end

    it "routes to #update" do
      expect(:put => "/doctor_lists/1").to route_to("doctor_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/doctor_lists/1").to route_to("doctor_lists#destroy", :id => "1")
    end

  end
end
