json.owned_deals @deals do |deal|
  json.id deal.id
  json.src deal.promotion.photo_img
  json.vendor_name deal.promotion.vendor.name
  json.title deal.promotion.name
  json.start_time deal.promotion.start_time
  json.end_time deal.promotion.end_time
  json.description deal.promotion.description
  json.address deal.promotion.vendor.address
  # json.disclaimer
end