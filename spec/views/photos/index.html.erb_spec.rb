require 'rails_helper'

RSpec.describe 'photos/index', type: :view do
  let(:file) { upload_file('pc_engine.png') }

  before(:each) do
    assign(:photos, create_list(:photo, 2, title: 'Title', file: file))
  end

  it '写真の一覧を表示する' do
    render
    assert_select 'tr>td', text: 'Title', count: 2
    assert_select 'tr>td>img', count: 2
    assert_select 'tr>td', text: file.size.to_s, count: 2
  end
end
