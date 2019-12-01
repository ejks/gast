class Vendor < ApplicationRecord
  belongs_to :user
  has_many :promotions
  has_many :deals, through: :promotions
end
