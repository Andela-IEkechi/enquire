require 'rails_helper'

RSpec.describe User, :type => :model do

  it "has a valid factory" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "should not allow changing of a user's role" do
    skip "find a way to implement this"
  end
end
