require 'spec_helper'

describe "swaps/show" do
  before(:each) do
    @swap = assign(:swap, stub_model(Swap,
      :name => "Name",
      :plant_type => "Plant Type",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Plant Type/)
    rendered.should match(/Description/)
  end
end
