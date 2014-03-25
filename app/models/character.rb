class Character < ActiveRecord::Base

  validates :name, :slug, presence: true, uniqueness: true

  attr_accessor :rating

  def to_param
    slug || id
  end

  def rating
    @rating ||= 1000
  end

end
