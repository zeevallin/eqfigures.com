class User < ActiveRecord::Base

  has_many :choices, dependent: :destroy

  def self.create_with_omniauth(auth)
    new.tap do |user|
      user.uid      = auth.uid
      user.provider = auth.provider
    end
  end

  def apply_omniauth_info(auth)
    self.name     = auth.info.name
    self.handle   = auth.info.nickname
    self.picture  = auth.info.image.try(:sub,"http","https")
  end

  def picture
    super || "https://avatars.io/twitter/#{handle}"
  end

end
