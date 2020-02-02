json.promotions @vendor.saved_promotions do |promotion|
  json.id promotion.id
  json.src promotion.photo_img
  json.vendor_name promotion.vendor.name
  json.title promotion.name
  json.start_time promotion.start_time
  json.end_time promotion.end_time
  json.description promotion.description
  json.address promotion.vendor.address
  # json.disclaimer
end