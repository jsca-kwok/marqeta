# frozen_string_literal: true

require 'bundler/setup'
require 'marqeta'
require 'simplecov'

Dir[("#{Dir.pwd}/spec/support/**/*.rb")].sort.each { |f| require f }

SimpleCov.start

RSpec.configure do |config|
  config.include FixturesHelpers
  config.include NetHTTPMock

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
