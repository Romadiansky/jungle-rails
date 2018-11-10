# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  email            :string
#  total_cents      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  stripe_charge_id :string
#

class Order < ActiveRecord::Base
#belongs_to association should have a db record to back it up. it does not exist. this sucks. fixit.
  belongs_to :user # <= poop
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end
