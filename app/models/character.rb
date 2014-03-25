class Character < ActiveRecord::Base

  validates :name, :slug, presence: true, uniqueness: true

  def to_param
    slug || id
  end

end
