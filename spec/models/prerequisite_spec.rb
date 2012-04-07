require 'spec_helper'

describe Prerequisite do
  before(:each) do
    @prerequisite_for = FactoryGirl.create(:course)
    @prerequisite = FactoryGirl.create(:course)
    @relationship = @prerequisite_for.prerequisite_relationships.build(:prereq_id => @prerequisite.id)
  end

  describe "Relationship creation" do
    it "should create a new instance given valid attributes" do
      @relationship.save!
    end
  end

  describe "methods" do
    before(:each) do
      @relationship.save
    end

    it "should have a prereq_id attribute" do
      @relationship.should respond_to(:prereq_id)
    end

    it "should have a prereq_for_id attribute" do
      @relationship.should respond_to(:prereq_for_id)
    end

    it "should have the right prereq" do
      @relationship.prereq.should eq(@prerequisite)
    end

    it "should have the right prereq_for" do
      @relationship.prereq_for.should eq(@prerequisite_for)
    end
  end

  describe "validations" do
    it "should require a prereq_id" do
      @relationship.prereq_id = nil
      @relationship.should_not be_valid
    end
    it "should require a prereq_for_id" do
      @relationship.prereq_for_id = nil
      @relationship.should_not be_valid
    end
  end
end
