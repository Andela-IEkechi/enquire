require 'rails_helper'

RSpec.describe "questions/edit", :type => :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :caption => "MyText",
      :body => "MyText",
      :user => nil,
      :doctor => nil
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "textarea#question_caption[name=?]", "question[caption]"

      assert_select "textarea#question_body[name=?]", "question[body]"

      assert_select "input#question_user_id[name=?]", "question[user_id]"

      assert_select "input#question_doctor_id[name=?]", "question[doctor_id]"
    end
  end
end
