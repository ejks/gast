class Deal < ApplicationRecord
  include ActiveModel::Serialization

  belongs_to :customer
  belongs_to :promotion
  delegate :vendor, to: :promotion

  def attributes
    { id: nil, cancel: nil }
  end
end
