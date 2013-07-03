require 'spec_helper'
require 'faker'

describe Instance do


  before(:each) do
    @attr = {
      :course  => Faker::Lorem.word,
      :instructor => "#{Faker::Name.first_name} #{Faker::Name.last_name}",
      :terms => true
    }

    #@attr = FactoryGirl.attributes_for(:instance)
  end

  it { should validate_presence_of :course }
  it { should validate_acceptance_of :terms }
  it { should validate_uniqueness_of :course }

  it "should create a new instance given a valid attribute" do
    Instance.new(@attr)
  end

  it "is invalid without a course" do
    no_course = Instance.new(@attr.merge(:course => ""))
    no_course.should_not be_valid
  end

  it "is invalid with a course name longer than 50 characters" do
    long_course_name = "f" * 55
    bad_course = Instance.new(@attr.merge(:course => long_course_name))
    bad_course.should_not be_valid
  end

  it "is invalid without an instructor" do
    no_instructor = Instance.new(@attr.merge(:instructor => ''))
    no_instructor.should raise_error
  end

  it "is invalid without accepting the terms" do
    no_terms = Instance.new(@attr.merge(:terms => false))
    no_terms.should_not be_valid
  end

end
