require "spec_helper"

describe Admin::InstancesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/instances").should route_to(:controller => "admin/instances", :action => "index")
    end

    it "routes to #new" do
      get("/admin/instances/new").should route_to(:controller => "admin/instances", :action => "new")
    end

    it "routes to #show" do
      get("/admin/instances/1").should route_to(:controller => "admin/instances", :action => "show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/instances/1/edit").should route_to(:controller => "admin/instances", :action => "edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/instances").should route_to(:controller => "admin/instances", :action => "create")
    end

    it "routes to #update" do
      put("/admin/instances/1").should route_to(:controller => "admin/instances", :action => "update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/instances/1").should route_to(:controller => "admin/instances", :action => "destroy", :id => "1")
    end

  end
end
