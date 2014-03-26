# encoding: utf-8

class PortraitUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    if Figaro.env.storage_type.to_sym == :fog
      Pathname.new('').join('uploads', model.class.to_s.underscore, "#{mounted_as}", "#{model.id}").to_s
    else
      Rails.root.join('public', 'uploads', model.class.to_s.underscore, "#{mounted_as}", "#{model.id}").to_s
    end
  end

  process :resize_to_fill => [512, 512]
  process :convert => 'png'

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

end
