require 'rails_helper'
require 'support/upload_file'

RSpec.describe "photos/show", type: :view do
  upload_file = upload_file('pc_engine.png')

  before(:each) do
    @photo = assign(:photo,
                    FactoryGirl.create(:photo,
                                       title: 'Title',
                                       image: upload_file,
                                       bytes: upload_file.size))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/pc_engine/)
    expect(rendered).to match(upload_file.size.to_s)
  end
end
