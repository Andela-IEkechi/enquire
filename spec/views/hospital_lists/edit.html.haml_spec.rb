require 'rails_helper'

RSpec.describe "hospital_lists/edit", type: :view do
  before(:each) do
    @hospital_list = assign(:hospital_list, HospitalList.create!(
      :user => nil,
      :hospital => nil
    ))
  end

  it "renders the edit hospital_list form" do
    render

    assert_select "form[action=?][method=?]", hospital_list_path(@hospital_list), "post" do

      assert_select "input#hospital_list_user_id[name=?]", "hospital_list[user_id]"

      assert_select "input#hospital_list_hospital_id[name=?]", "hospital_list[hospital_id]"
    end
  end
end
