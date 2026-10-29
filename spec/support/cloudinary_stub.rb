# テストでは Cloudinary に実際にはアップロード・削除しない
RSpec.configure do |config|
  config.before do
    Cloudinary.config do |c|
      c.cloud_name = 'my_cloud_name'
      c.api_key = 'my_api_key'
      c.api_secret = 'my_api_secret'
    end

    allow(Cloudinary::Uploader).to receive(:upload) do |_file, params|
      {
        'public_id' => params[:public_id] || 'sample', 'version' => '1',
        'format' => 'png', 'resource_type' => 'image', 'type' => 'upload',
      }
    end
    allow(Cloudinary::Uploader).to receive(:destroy).and_return('result' => 'ok')
  end
end
