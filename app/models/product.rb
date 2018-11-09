# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  description  :text
#  discarded_at :datetime
#  image        :string
#  name         :string
#  price_cents  :integer
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :integer
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)

class Product < ActiveRecord::Base

  include Discard::Model
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
