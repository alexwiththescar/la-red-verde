require 'spec_helper'

describe "farms/edit" do
  before(:each) do
    @farm = assign(:farm, stub_model(Farm,
      :name => "MyString",
      :content => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit farm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => farms_path(@farm), :method => "post" do
      assert_select "input#farm_name", :name => "farm[name]"
      assert_select "input#farm_content", :name => "farm[content]"
      assert_select "input#farm_user_id", :name => "farm[user_id]"
    end
  end
end
