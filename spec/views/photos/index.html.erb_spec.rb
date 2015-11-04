require 'rails_helper'
require 'support/upload_file'

UPLOAD_FILE = upload_file('pc_engine.png')

RSpec.describe 'photos/index', type: :view do
  before(:each) do
    assign(:photos, [FactoryGirl.create(:photo,
                                        title: 'Title',
                                        image: UPLOAD_FILE,
                                        bytes: UPLOAD_FILE.size),
                     FactoryGirl.create(:photo,
                                        title: 'Title',
                                        image: UPLOAD_FILE,
                                        bytes: UPLOAD_FILE.size)])
  end

  it 'renders a list of photos' do
    render
    assert_select 'tr>td', text: 'Title', count: 2
    assert_select 'tr>td', text: /pc_engine/, count: 2
    assert_select 'tr>td', text: UPLOAD_FILE.size.to_s, count: 2
  end
end
