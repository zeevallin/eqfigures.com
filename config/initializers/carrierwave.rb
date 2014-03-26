CarrierWave.configure do |config|

  config.enable_processing = true
  config.cache_dir = Rails.root.join('tmp', 'uploads').to_s

  if Figaro.env.storage_type.to_sym == :fog
    config.storage = :fog
    config.fog_credentials = Hash[
      provider:           'Rackspace',
      rackspace_username: Figaro.env.rackspace_username,
      rackspace_api_key:  Figaro.env.rackspace_api_key,
      rackspace_region:   :ord
    ]
    config.asset_host    = Figaro.env.fog_host
    config.fog_directory = Figaro.env.fog_dir
  else
    config.storage = :file
    config.permissions = 0666
    config.directory_permissions = 0777
  end

end