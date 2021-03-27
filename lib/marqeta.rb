# frozen_string_literal: true

require 'marqeta/version'
require 'net/http'
require 'uri'
require 'json'
require 'dry-struct'
require 'dry-types'

require 'marqeta/resources/ping'
require 'marqeta/resources/user'

module Marqeta
  autoload :Configuration, 'marqeta/configuration'
  autoload :HTTP, 'marqeta/http'
  autoload :Resources, 'marqeta/resources'
end
