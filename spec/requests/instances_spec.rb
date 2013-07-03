require 'spec_helper'

describe "Instances" do

  describe "GET /instances/new" do
    it "gets the instances/new path" do
      get new_instance_path
      response.status.should be(200)
    end
  end

  describe "GET /instances/thanks" do
    it "gets the instance/thanks path" do
      get instances_thanks_path
      response.status.should be(200)
    end
  end
end
