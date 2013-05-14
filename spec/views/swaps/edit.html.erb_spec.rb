require 'spec_helper'

describe "swaps/edit" do
  before(:each) do
    @swap = assign(:swap, stub_model(Swap,
      :name => "MyString",
      :plant_type => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit swap form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => swaps_path(@swap), :method => "post" do
      assert_select "input#swap_name", :name => "swap[name]"
      assert_select "input#swap_plant_type", :name => "swap[plant_type]"
      assert_select "input#swap_description", :name => "swap[description]"
    end
  end
end
