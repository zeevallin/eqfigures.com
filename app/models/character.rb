class Character < ActiveRecord::Base

  mount_uploader :portrait, PortraitUploader

  validates :name, :slug, presence: true, uniqueness: true

  attr_accessor :rating, :times_matched

  def to_param
    slug || id
  end

  def rating
    @rating ||= 1000
  end

  def times_matched
    @times_matched || 0
  end

end
