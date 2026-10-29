# テスト用のアップロードファイルを作るヘルパ
module UploadFile
  module_function

  # spec/fixtures にある画像からアップロードファイルを作る
  #
  # filename:: spec/fixtures 内のファイル名
  # 戻り値:: Rack::Test::UploadedFile
  def upload_file(filename)
    Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures', filename),
                                 "image/#{File.extname(filename).delete('.')}")
  end
end
