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

require 'support/upload_file'

module UploadFile
  UPLOAD_FILE = upload_file('pc_engine.png')
end

FactoryGirl.define do
  factory :photo do
    title FFaker::BaconIpsum.words.join ' '
    image UploadFile::UPLOAD_FILE
    bytes UploadFile::UPLOAD_FILE.size
  end
end
