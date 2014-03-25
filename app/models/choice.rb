class Choice < ActiveRecord::Base

  belongs_to :user

  def characters
    @characters ||= Character.find(a, b)
  end

  def self.determine(a, b, user = nil)
    new.tap do |choice|
      choice.user = user
      choice.a = a
      choice.b = b
    end
  end

end
