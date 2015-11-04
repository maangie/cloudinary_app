require 'rails_helper'
require 'support/upload_file'

UPLOAD_FILE = upload_file('pc_engine.png')

RSpec.describe "photos/show", type: :view do
  before(:each) do
    @photo = assign(:photo, FactoryGirl.create(:photo,
                                               title: 'Title',
                                               image: UPLOAD_FILE,
                                               bytes: UPLOAD_FILE.size))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/pc_engine/)
    expect(rendered).to match(UPLOAD_FILE.size.to_s)
  end
end
