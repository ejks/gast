json.cards @promotions do |promotion|
  json.id promotion.id
  json.img promotion.photo_img
  json.description promotion.description
  # json.disclaimer 
  json.start_time promotion.start_time
  json.end_time promotion.end_time
  json.vendor_address promotion.vendor.address
  json.vendor_name promotion.vendor.name
  json.vendor_des promotion.vendor.description
  json.vendor_avatar promotion.vendor.logo_img
  # json.vendor_img
  json.vendor_phone promotion.vendor.contact_number
end
