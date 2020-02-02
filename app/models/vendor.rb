class Vendor < ApplicationRecord
  belongs_to :user
  has_many :promotions
  has_many :deals, through: :promotions

  enum vendor_type: { not_assigned: 0, restaurant: 1, bar: 2, cafe: 3, grocery_store: 4 }

  def vendor_type_int
    vendor_types[vendor_type]
  end

  def saved_promotions
    promotions.where(status: ['draft', 'onsale'])
  end
end
