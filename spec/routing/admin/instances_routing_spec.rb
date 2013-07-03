require "spec_helper"

describe Admin::InstancesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/instances").should route_to("instances#index")
    end

    it "routes to #new" do
      get("/admin/instances/new").should route_to("instances#new")
    end

    it "routes to #show" do
      get("/admin/instances/1").should route_to("instances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/instances/1/edit").should route_to("instances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/instances").should route_to("instances#create")
    end

    it "routes to #update" do
      put("/admin/instances/1").should route_to("instances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/instances/1").should route_to("instances#destroy", :id => "1")
    end

  end
end
