CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      ENV['AKIAIOHBF7UROJLPAF2A'],
      aws_secret_access_key:  ENV['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'],
      region:                 'us-west-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  

  if Rails.env.test? || Rails.env.cucumber?
  	config.storage			 = :file
  	config.enable_processing = false
  	config.roduction = "#{Rails.root}/tmp"
  else 
  	config.storage = :fog 
  end 
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory = ENV['oped']
end


