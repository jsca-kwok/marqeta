# frozen_string_literal: true

require 'marqeta/version'
require 'net/http'
require 'uri'
require 'json'

require 'dry-types'
require 'dry-validation'
require 'marqeta/ping'
require 'marqeta/user'
require 'marqeta/webhook'

module Marqeta
  autoload :Configuration, 'marqeta/configuration'
  autoload :HTTP, 'marqeta/http'
  autoload :Types, 'marqeta/types'
  autoload :Schemas, 'marqeta/schemas'
end
