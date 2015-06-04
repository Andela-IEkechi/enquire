require "rails_helper"

RSpec.describe ProfilesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/profiles").to route_to("user_profileex")
    end

    it "routes to #new" do
      expect(:get => "/user_profiprofile route_to("user_profiles#nprofile

    it "routes to #show" do
      expect(:get => "/user_profiles/1").toprofileser_profiles#show", :id profileend

    it "routes to #edit" do
      expect(:get => "/user_profiles/1/edit").to routprofilerofiles#edit", :id => "1")
  profilet "routes to #create" do
      expect(:post => "/user_profiles").to route_to("user_profilprofile    end

    it "routeprofile" do
      expect(:put => "/user_profiles/1").to route_to("user_profiles#updatprofile1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_profiles/1").to route_to("user_profiles#destroy", :id => "1")
    end

  end
end
