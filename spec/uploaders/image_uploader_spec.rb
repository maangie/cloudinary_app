require 'rails_helper'

RSpec.describe ImageUploader do
  describe '画像の保存' do
    it 'CarrierWave の filename の警告を出さない' do
      expect { create(:photo) }.not_to output(/didn't return value after storing/).to_stderr
    end

    it '保存したあとは filename が Cloudinary の版、ID、形式を返す' do
      photo = create(:photo)
      expect(photo.image.filename).to eq 'v1/pc_engine.png.png'
    end
  end
end
