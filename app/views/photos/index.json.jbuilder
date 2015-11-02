json.array!(@photos) do |photo|
  json.extract! photo, :id, :title, :image, :bytes
  json.url photo_url(photo, format: :json)
end
