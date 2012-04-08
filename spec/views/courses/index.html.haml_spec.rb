require 'spec_helper'

describe "courses/index" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :name => "Name",
        :code => "ABC123",
        :description => "Description"
      ),
      stub_model(Course,
        :name => "Name",
        :code => "ABS202",
        :description => "Description"
      )
    ])
  end

  it "renders a list of courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "ABC123".to_s, :count => 1
    assert_select "tr>td", :text => "ABS202".to_s, :count => 1
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
