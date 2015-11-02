require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :title => "MyString",
      :image => "MyString",
      :bytes => 1
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_title[name=?]", "photo[title]"

      assert_select "input#photo_image[name=?]", "photo[image]"

      assert_select "input#photo_bytes[name=?]", "photo[bytes]"
    end
  end
end
