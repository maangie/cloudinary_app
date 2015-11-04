def upload_file(filename)
  Rack::Test::UploadedFile.new("spec/fixtures/#{filename}",
                               "image/#{File.extname(filename)}")
end
