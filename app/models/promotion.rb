class Promotion < ApplicationRecord
  belongs_to :vendor
  has_many :deals

  STATUS = { draft: 0, onsale: 1, trash: 2 }
  enum status: STATUS

  def status_int
    STATUS[status.to_sym]
  end
end
