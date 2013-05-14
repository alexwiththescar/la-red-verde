require 'spec_helper'

describe "swaps/new" do
  before(:each) do
    assign(:swap, stub_model(Swap,
      :name => "MyString",
      :plant_type => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new swap form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => swaps_path, :method => "post" do
      assert_select "input#swap_name", :name => "swap[name]"
      assert_select "input#swap_plant_type", :name => "swap[plant_type]"
      assert_select "input#swap_description", :name => "swap[description]"
    end
  end
end
