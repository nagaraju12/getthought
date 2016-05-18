Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '243625906010498', 'ad8c106c6dcda028ac75f2a60413f7ab', :scope => 'email,public_profile',  :info_fields => 'name,email'if Rails.env == 'production'
  provider :facebook, '780404748727302', '1ea899f5718c534ae149b1b65ccaca3c',  :scope =>'email,public_profile', :info_fields => 'name,email' if Rails.env == 'development'
end
