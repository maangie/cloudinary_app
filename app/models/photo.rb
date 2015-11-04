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

class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :image, presence: true
  validates :bytes, numericality: { greater_than: 0 }
end
