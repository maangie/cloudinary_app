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

require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :image }
  it { should validate_numericality_of(:bytes).is_greater_than 0 }
end
