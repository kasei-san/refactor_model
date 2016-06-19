class User < ActiveRecord::Base
  delegate :zipcode, :prefecture_code, :city_code, :address, to: :profile
  has_one :profile
end
