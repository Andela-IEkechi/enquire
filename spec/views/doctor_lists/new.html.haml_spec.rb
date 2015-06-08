require 'rails_helper'

RSpec.describe "doctor_lists/new", type: :view do
  before(:each) do
    assign(:doctor_list, DoctorList.new(
      :user => nil,
      :hospital => nil
    ))
  end

  it "renders new doctor_list form" do
    render

    assert_select "form[action=?][method=?]", doctor_lists_path, "post" do

      assert_select "input#doctor_list_user_id[name=?]", "doctor_list[user_id]"

      assert_select "input#doctor_list_hospital_id[name=?]", "doctor_list[hospital_id]"
    end
  end
end
