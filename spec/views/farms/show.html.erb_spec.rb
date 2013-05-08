require 'spec_helper'

describe "farms/show" do
  before(:each) do
    @farm = assign(:farm, stub_model(Farm,
      :name => "Name",
      :content => "Content",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Content/)
    rendered.should match(/1/)
  end
end
