class Deal < ApplicationRecord
  belongs_to :customer
  belongs_to :promotion
  delegate :vendor, to: :promotion
end
