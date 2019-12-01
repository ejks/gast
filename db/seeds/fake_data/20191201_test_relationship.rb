ActiveRecord::Base.transaction do
  user1 = User.create_or_find_by(
    name: 'Kitty',
    email: 'kitty@example.com',
    password: 'aaaa1111'
  )

  user2 = User.create_or_find_by(
    name: 'Ellen',
    email: 'ellen@example.com',
    password: 'bbbb2222'
  )

  user3 = User.create_or_find_by(
    name: 'Samir',
    email: 'samir@example.com',
    password: 'cccc3333'
  )

  user4 = User.create_or_find_by(
    name: 'Jianan',
    email: 'jianan@example.com',
    password: 'dddd4444'
  )

  c1 = Customer.create_or_find_by(
    user_id: user1.id,
    name: user1.name
  )

  c2 = Customer.create_or_find_by(
    user_id: user2.id,
    name: user2.name
  )

  v1 = Vendor.create_or_find_by(
    user_id: user3.id,
    name: user3.name,
    contact_number: '123456789',
    address: '中國上海市威海路666號',
    description: '很棒的地方'
  )

  v2 = Vendor.create_or_find_by(
    user_id: user4.id,
    name: user4.name,
    contact_number: '123456789',
    address: '中國上海市石門一路777號',
    description: '另一個很棒的地方'
  )

  p1 = Promotion.create_or_find_by(
    vendor_id: v1.id,
    name: '50% discount of big burger',
    description: '好吃到哭的漢堡',
    start_time: Time.now - 1.hour,
    end_time: Time.now + 1.day,
    status: 1
  )

  p2 = Promotion.create_or_find_by(
    vendor_id: v1.id,
    name: '30% discount of super spicy curry',
    description: '辣到你哭咖哩',
    start_time: Time.now + 1.hour,
    end_time: Time.now + 4.hour,
    status: 2
  )

  p3 = Promotion.create_or_find_by(
    vendor_id: v2.id,
    name: '70% discount of sweet honey cake',
    description: '甜到你心裏蜂蜜蛋糕',
    start_time: Time.now - 1.hour,
    end_time: Time.now + 3.hour,
    status: 3
  )

  p4 = Promotion.create_or_find_by(
    vendor_id: v1.id,
    name: '90% discount of chicken',
    description: '幾乎不用錢的雞肉',
    start_time: Time.now - 3.hour,
    end_time: Time.now + 1.hour,
    status: 1
  )

  d1 = Deal.create_or_find_by(
    customer_id: c1.id,
    promotion_id: p1.id,
    cancel: false
  )

  d2 = Deal.create_or_find_by(
    customer_id: c1.id,
    promotion_id: p4.id,
    cancel: true
  )

  d2 = Deal.create_or_find_by(
    customer_id: c2.id,
    promotion_id: p1.id,
    cancel: true
  )
end


Deal.create(customer_id: Customer.first.id,promotion_id: Promotion.first.id,cancel: 1)