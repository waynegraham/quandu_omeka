require 'spec_helper'

describe "instances/index" do
  before(:each) do
    assign(:instances, [
      stub_model(Instance,
        :course => "Course",
        :instructor => "Instructor",
        :terms => false
      ),
      stub_model(Instance,
        :course => "Course",
        :instructor => "Instructor",
        :terms => false
      )
    ])
  end

  it "renders a list of instances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Course".to_s, :count => 2
    assert_select "tr>td", :text => "Instructor".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
