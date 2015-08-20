require 'rails_helper'

RSpec.describe Rating, type: :model do
  it 'should have a valid factory do' do
    rating = FactoryGirl.build(:rating)
    expect(rating).to be_valid
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
