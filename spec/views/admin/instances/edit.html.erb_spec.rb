require 'spec_helper'

describe "admin/instances/edit" do
  before(:each) do
    @instance = assign(:instance, stub_model(Instance,
      :course => "MyString",
      :instructor => "MyString",
      :terms => true
    ))
  end

  it "renders the edit instance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", instance_path(@instance), "post" do
      assert_select "input#instance_course[name=?]", "instance[course]"
      assert_select "input#instance_instructor[name=?]", "instance[instructor]"
      assert_select "input#instance_terms[name=?]", "instance[terms]"
    end
  end
end
