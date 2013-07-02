require 'spec_helper'

describe "instances/new" do
  before(:each) do
    assign(:instance, stub_model(Instance,
      :course => "MyString",
      :instructor => "MyString",
      :terms => false
    ).as_new_record)
  end

  it "renders new instance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", instances_path, "post" do
      assert_select "input#instance_course[name=?]", "instance[course]"
      assert_select "input#instance_instructor[name=?]", "instance[instructor]"
      assert_select "input#instance_terms[name=?]", "instance[terms]"
    end
  end
end
