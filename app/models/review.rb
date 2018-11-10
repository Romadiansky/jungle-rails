# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  description :string
#  rating      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer
#  user_id     :integer

class Review < ActiveRecord::Base
  validates :product_id, :user_id, :rating, :description, presence: true

  belongs_to :product
  belongs_to :user

  scope :latest_first, -> { order(:created_at => :desc) }
end
