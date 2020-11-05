class Player < ActiveRecord::Base

  validates :name, presence: true
  validates :phone_number, presence: true

  def to_pleasant_string
  end
end
