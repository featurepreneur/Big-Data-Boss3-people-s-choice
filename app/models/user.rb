class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :phone_number, presence: true

  def to_pleasant_string
  end
end
