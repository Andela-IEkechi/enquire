CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_ID"],
      aws_secret_access_key: ENV["AWS_ACCESS_SECRET_KEY"]
  }
  config.fog_directory  = "andela-ratsi"
  config.fog_public     = false
end