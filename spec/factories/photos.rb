# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  title      :string
#  image      :string
#  bytes      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require Rails.root.join('spec/support/upload_file')

FactoryBot.define do
  factory :photo do
    transient do
      file { UploadFile.upload_file('pc_engine.png') }
    end

    title { FFaker::BaconIpsum.words.join ' ' }
    image { file }
    bytes { file.size }
  end
end
