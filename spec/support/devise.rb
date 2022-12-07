RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :view
end