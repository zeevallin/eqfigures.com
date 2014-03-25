class Character < ActiveRecord::Base

  validates :name, :slug, presence: true

  def to_param
    slug || id
  end

end
