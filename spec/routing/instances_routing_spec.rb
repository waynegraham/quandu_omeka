require "spec_helper"

describe InstancesController do
  describe "routing" do

    it "routes to #new" do
      get("/instances/new").should route_to("instances#new")
    end

    it "routes to #create" do
      post("/instances").should route_to("instances#create")
    end

    it "routes to #thanks" do
      get('/instances/thanks').should route_to('instances#thanks')
    end

  end
end
