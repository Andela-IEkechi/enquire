require 'rails_helper'

RSpec.describe "hospital_lists/new", type: :view do
  before(:each) do
    assign(:hospital_list, HospitalList.new(
      :user => nil,
      :hospital => nil
    ))
  end

  it "renders new hospital_list form" do
    render

    assert_select "form[action=?][method=?]", hospital_lists_path, "post" do

      assert_select "input#hospital_list_user_id[name=?]", "hospital_list[user_id]"

      assert_select "input#hospital_list_hospital_id[name=?]", "hospital_list[hospital_id]"
    end
  end
end
