class User < ActiveRecord::Base
  delegate :zipcode,  :prefecture_code,  :city_code,  :address,  to: :profile
  delegate :zipcode=, :prefecture_code=, :city_code=, :address=, to: :profile_
  has_one :profile, dependent: :destroy

  def profile_
    self.profile ||= Profile.new
  end
end
