class Promotion < ApplicationRecord
  belongs_to :vendor
  has_many :deals

  enum status: { draft: 0, onsale: 1, trash: 2 }
end
