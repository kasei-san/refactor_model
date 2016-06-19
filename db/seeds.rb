
Faker::Config.locale = :ja

1.upto(1000) do |i|
  prefecture_code = (1..47).to_a.sample
  User.create(
    name:            Faker::Name.name,
    mail:            Faker::Internet.email,
    zipcode:         Faker::Address.zip_code,
    prefecture_code: prefecture_code,
    city_code:       prefecture_code*1000 + (1..999).to_a.sample,
    address:         Faker::Address.street_address
  )
end


