class Promotion < ApplicationRecord
  belongs_to :vendor
  has_many :deals
end
