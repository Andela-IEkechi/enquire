require 'rails_helper'

RSpec.describe "doctor_lists/edit", type: :view do
  before(:each) do
    @doctor_list = assign(:doctor_list, DoctorList.create!(
      :user => nil,
      :hospital => nil
    ))
  end

  it "renders the edit doctor_list form" do
    render

    assert_select "form[action=?][method=?]", doctor_list_path(@doctor_list), "post" do

      assert_select "input#doctor_list_user_id[name=?]", "doctor_list[user_id]"

      assert_select "input#doctor_list_hospital_id[name=?]", "doctor_list[hospital_id]"
    end
  end
end
