# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null

# Table name: users

#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  validates :password, confirmation: { case_sensitive: true }
  validates :email, uniqueness:  { case_sensitive: false }
  validates :email, :first_name, :last_name, presence: true
  validates :password, length: { in: 3..20 }

  has_secure_password
  has_many :reviews

  def self.authenticate_with_credentials(email, password)
  end

end
