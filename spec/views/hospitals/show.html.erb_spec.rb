require 'rails_helper'

RSpec.describe "hospitals/show", :type => :view do
  before(:each) do
    @hospital = assign(:hospital, Hospital.create!(
      :name => "MyText",
      :description => "MyText",
      :image => "Image",
      :verified => false,
      :address => "MyText",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Type/)
  end
end
