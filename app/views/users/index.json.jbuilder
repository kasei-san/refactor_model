json.array!(@users) do |user|
  json.extract! user, :id, :name, :mail, :zipcode, :prefecture_code, :city_code, :address
  json.url user_url(user, format: :json)
end
