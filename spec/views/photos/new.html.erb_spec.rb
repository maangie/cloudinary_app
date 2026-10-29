require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      title: "MyString",
      image: "MyString",
      bytes: 1
    ))
  end

  it "写真の新規登録フォームを表示する" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_title[name=?]", "photo[title]"

      assert_select "input#photo_image[name=?]", "photo[image]"

      assert_select "input#photo_bytes[name=?]", "photo[bytes]"
    end
  end
end
