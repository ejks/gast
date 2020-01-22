class Customer < ApplicationRecord
  belongs_to :user
  has_many :deals

  # def owned_deals
  #   deals
  # end
end
