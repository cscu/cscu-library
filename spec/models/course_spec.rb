require 'spec_helper'

describe Course do
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
