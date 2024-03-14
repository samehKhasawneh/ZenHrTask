RSpec.configure do |config|
  config.openapi_root = Rails.root.to_s + '/swagger'
  config.rswag_dry_run = false
end