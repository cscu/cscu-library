require 'spec_helper'

describe Course do


  describe "fields" do
    before(:each) do
      @course = Course.create!
    end

    it "should have a subject" do
      @course.should respond_to(:subject)
    end

    it "should have a number" do
      @course.should respond_to(:number)
    end

    it "should have a code" do
      @course.should respond_to(:code)
    end

    it "should have a name" do
      @course.should respond_to(:name)
    end

    it "should have a description" do
      @course.should respond_to(:description)
    end
  end

  describe "course code" do
    it "is a combination of subject and number" do
      @course = Course.create! :subject => 'CPS', :number => '109'
      @course.code.should eq('CPS109')
    end
  end

  describe "prerequisites" do
    before(:each) do
      @course = Course.create!
      @prereq = FactoryGirl.create(:course)
    end

    it "should have a prerequisites method" do
      @course.should respond_to(:prerequisites)
    end

    it "should have an add_prerequisite! method" do
      @course.add_prerequisite! @prereq
      @course.has_prerequisite?(@prereq).should be_true
    end

    it "should have a remove_prerequisite! method" do
      @course.add_prerequisite! @prereq
      @course.remove_prerequisite! @prereq
      @course.has_prerequisite?(@prereq).should be_false
    end
  end
end
