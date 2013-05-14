require 'spec_helper'

describe "swaps/index" do
  before(:each) do
    assign(:swaps, [
      stub_model(Swap,
        :name => "Name",
        :plant_type => "Plant Type",
        :description => "Description"
      ),
      stub_model(Swap,
        :name => "Name",
        :plant_type => "Plant Type",
        :description => "Description"
      )
    ])
  end

  it "renders a list of swaps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Plant Type".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
