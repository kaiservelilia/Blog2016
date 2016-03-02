OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '938988499503777', '321a038fa8760f11721d75553d426239
', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :facebook, ENV['938988499503777'],     ENV['321a038fa8760f11721d75553d426239'],     :scope => 'email,offline_access,read_stream', :display => 'popup'
  
# end