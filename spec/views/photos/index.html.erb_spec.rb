require 'rails_helper'
require 'support/upload_file'

RSpec.describe 'photos/index', type: :view do
  upload_file = upload_file('pc_engine.png')

  before(:each) do
    assign(:photos, [FactoryGirl.create(:photo,
                                        title: 'Title',
                                        image: upload_file,
                                        bytes: upload_file.size),
                     FactoryGirl.create(:photo,
                                        title: 'Title',
                                        image: upload_file,
                                        bytes: upload_file.size)])
  end

  it 'renders a list of photos' do
    render
    assert_select 'tr>td', text: 'Title', count: 2
    assert_select 'tr>td>img', count: 2
    assert_select 'tr>td', text: upload_file.size.to_s, count: 2
  end
end
