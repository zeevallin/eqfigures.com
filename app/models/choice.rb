class Choice < ActiveRecord::Base

  belongs_to :user, dependent: :destroy

  def characters
    @characters ||= Character.find(a, b)
  end

  def self.suggest(a, b, user = nil)
    new.tap do |choice|
      choice.user = user
      choice.a = a
      choice.b = b
    end
  end

  def winner_params(winner)
    attributes = case winner.to_sym
    when :a then Hash[ a: a, b: b, x: a ]
    when :b then Hash[ a: a, b: b, x: b ]
    end
    Hash[ character: attributes ]
  end

end
