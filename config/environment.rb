# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
config.force_ssl = false  # Railway handle SSL sendiri
config.assets.compile = true
config.public_file_server.enabled = true