class Choice < ActiveRecord::Base

  belongs_to :user

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
    attributes = case winner.try(:to_sym)
    when :a then Hash[ a: a, b: b, x: a ]
    when :b then Hash[ a: a, b: b, x: b ]
    when nil then Hash[ a: a, b: b, x: nil ]
    end
    Hash[ character: attributes ]
  end

end
