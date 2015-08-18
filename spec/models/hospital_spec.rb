require 'rails_helper'

RSpec.describe Hospital, :type => :model do
  it "has a valid factory" do
    hospital = FactoryGirl.build(:hospital)
    expect(hospital).to be_valid
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
