require "rails_helper"

RSpec.describe ProfilesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/profiles").to route_to("profiles#index")
    end

    it "routes to #show" do
      expect(:get => "/profiles/1").to route_to("profiles#show", id: "1")
    end

    it "does not routes to #new" do
      expect(:get => "/profiles/new").not_to route_to("profiles#new")
    end

    it "does not routes to #edit" do
      expect(:get => "/profiles/1/edit").not_to be_routable
    end

    it "does not routes to #create" do
      expect(:post => "/profiles").not_to be_routable
    end

    it "does not route to #update" do
      expect(:put => "/profiles/1").not_to be_routable
    end

    it "does not routes to #destroy" do
      expect(:delete => "/profiles/1").not_to be_routable
    end

  end
end
