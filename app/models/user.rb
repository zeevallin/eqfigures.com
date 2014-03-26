class User < ActiveRecord::Base

  has_many :choices, dependent: :destroy

  def self.create_with_omniauth(auth)
    new.tap do |user|
      user.uid      = auth.uid
      user.provider = auth.provider
      user.name     = auth.info.name
      user.handle   = auth.info.nickname
      user.picture  = auth.info.image.try(:sub,"http","https")
    end
  end

  def picture
    super || "https://avatars.io/twitter/#{handle}"
  end

end
