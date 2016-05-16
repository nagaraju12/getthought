OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '474072752802653', '9489e37f48a97575a9e61abd2d6894a9', {:provider_ignores_state => true}
end