# == Schema Information
#
# Table name: line_items
#
#  id                :integer          not null, primary key
#  item_price_cents  :integer
#  quantity          :integer
#  total_price_cents :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  order_id          :integer
#  product_id        :integer
#
# Indexes
#
#  index_line_items_on_order_id    (order_id)
#  index_line_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#

class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

end
