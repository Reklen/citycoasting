OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1505096556404291', '8997c9ef91ee7902b955f4efbf5c4d64'
end