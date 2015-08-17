require 'rails_helper'

RSpec.describe User, :type => :model do

  it "" do
    user = FactoryGirl.build(:user)
    pp user
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
