User.create!(name: "Nguyen Quoc Viet",
  email: "vietnq812@gmail.com",
  password: "123123123",
  password_confirmation: "123123123",
  role: 1,
  activated: 1, activated_at: Time.zone.now)
20.times do |n|
name = Faker::Name.name
email = "example-#{n + 1}@gmail.com"
User.create!(name: name,
  email: email,
  password: "password",
  password_confirmation: "password",
  role: 0,
  activated: 1, activated_at: Time.zone.now)
end

Category.create!(name: "Category 1")
10.times do |n|
  nameCategory = Faker::Appliance.brand
  nameParent = Faker::Computer.os
  parent_idCate = n +1
  Category.create!(name: nameParent,
    parent_id: parent_idCate)
end

20.times do |n|
  category_idProduct = Faker::Number.within(range: 1..10)
  nameProduct = Faker::Device.model_name
  descriptionProduct = Faker::Lorem.paragraph(sentence_count: 100)
  viewProduct = Faker::Number.number(digits: 3)
  quantityProduct = Faker::Number.number(digits: 2)
  priceProduct = Faker::Number.number(digits: 6)
  saleProduct = Faker::Number.between(from: 10, to: 20)
  Product.create!(category_id: category_idProduct,
    name: nameProduct,
    description: descriptionProduct,
    view: viewProduct,
    quantity: quantityProduct,
    price: priceProduct,
    sale: saleProduct)
end

50.times do |n|
  user_idComment = Faker::Number.within(range: 1..20)
  productidComment = Faker::Number.within(range: 1..20)
  commentComment = Faker::Lorem.paragraph(sentence_count: 1)
  Comment.create!(user_id: user_idComment,
    product_id: productidComment,
    comment: commentComment)
end

20.times do |n|
  user_idRate = Faker::Number.within(range: 1..20)
  product_idRate = Faker::Number.within(range: 1..20)
  rate = Faker::Number.within(range: 1..5)
  Rate.create!(user_id: user_idRate,
    product_id: product_idRate,
    rate: rate)
end
