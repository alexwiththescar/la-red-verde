require 'spec_helper'

describe "farms/new" do
  before(:each) do
    assign(:farm, stub_model(Farm,
      :name => "MyString",
      :content => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new farm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => farms_path, :method => "post" do
      assert_select "input#farm_name", :name => "farm[name]"
      assert_select "input#farm_content", :name => "farm[content]"
      assert_select "input#farm_user_id", :name => "farm[user_id]"
    end
  end
end
