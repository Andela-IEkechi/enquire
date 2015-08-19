require 'rails_helper'

RSpec.describe HospitalLike, :type => :model do
  it "has a valid factory" do
    like = FactoryGirl.build(:hospital_like)
    expect(like).to be_valid
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
