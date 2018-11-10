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
#

class Review < ActiveRecord::Base
end
