admin = User.new(
  name: "Nguyen Quoc Viet",
  email: "vietnq812@gmail.com",
  password: "123123123",
  password_confirmation: "123123123",
  role: 1,
  activated: 1, confirmed_at: Time.zone.now)
admin.skip_confirmation!
admin.save!

20.times do |n|
name = Faker::Name.name
email = "example-#{n + 1}@gmail.com"
User.create!(name: name,
  email: email,
  password: "123123123",
  password_confirmation: "123123123",
  role: 0,
  activated: 1, confirmed_at: Time.zone.now)
end

Category.create!(name: "Category 1")
20.times do |n|
  nameCategory = "Category #{n+1}"
  parent_idCate = n
  Category.create!(name: nameCategory,
    parent_id: parent_idCate)
end

20.times do |n|
  category_idProduct = n + 1
  nameProduct = "Product #{n}"
  descriptionProduct = "description of product"
  viewProduct = n*1000
  quantityProduct = n*10
  priceProduct = n*12300
  saleProduct = n
  Product.create!(category_id: category_idProduct,
    name: nameProduct,
    description: descriptionProduct,
    view: viewProduct,
    quantity: quantityProduct,
    price: priceProduct,
    sale: saleProduct)
end

20.times do |n|
  user_idComment = n
  productidComment = n
  commentComment = "comment#{n}"
  Comment.create!(user_id: user_idComment,
    product_id: productidComment,
    comment: commentComment)
end

20.times do |n|
  user_idRate = n
  product_idRate = n
  rate = 4.5
  Rate.create!(user_id: user_idRate,
    product_id: product_idRate,
    rate: rate)
end
