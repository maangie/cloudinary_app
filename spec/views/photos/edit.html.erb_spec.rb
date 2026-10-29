require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before(:each) do
    @photo = create(:photo)
  end

  it "写真の編集フォームを表示する" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_title[name=?]", "photo[title]"

      assert_select "input#photo_image[name=?]", "photo[image]"

      assert_select "input#photo_bytes[name=?]", "photo[bytes]"
    end
  end
end
