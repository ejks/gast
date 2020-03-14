class Customer < ApplicationRecord
  belongs_to :user
  has_many :deals

  def active_deals
    deals
    .select { |d| d.cancel == false && 
                  d.promotion.status_int == Promotion::STATUS[:onsale] }
    .map do |deal|
      deal.serializable_hash(include: { promotion: { only: [:id, 
                                                            :name,
                                                            :description,
                                                            :start_time,
                                                            :end_time,
                                                            :status,
                                                            :photo_img] } })
    end
  end
end
