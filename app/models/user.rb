class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    new.tap do |user|
      user.uid      = auth.uid
      user.provider = auth.provider
      user.name     = auth.info.name
      user.handle   = auth.info.nickname
    end
  end

end
