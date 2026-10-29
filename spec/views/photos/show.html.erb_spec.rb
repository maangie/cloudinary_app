require 'rails_helper'

RSpec.describe "photos/show", type: :view do
  let(:file) { upload_file('pc_engine.png') }

  before(:each) do
    @photo = assign(:photo, create(:photo, title: 'Title', file: file))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/pc_engine/)
    expect(rendered).to match(file.size.to_s)
  end
end
