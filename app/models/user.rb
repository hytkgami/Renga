class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["id"]
      user.name = auth["info"]["name"]
    end
  end
end
