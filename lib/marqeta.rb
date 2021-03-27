# frozen_string_literal: true

require 'marqeta/version'
require 'net/http'
require 'uri'
require 'json'
require 'dry-struct'
require 'dry-types'
require 'dry-validation'

require 'marqeta/resources/ping'
require 'marqeta/resources/user'

module Marqeta
  autoload :Configuration, 'marqeta/configuration'
  autoload :HTTP, 'marqeta/http'
  autoload :Resources, 'marqeta/resources'
  autoload :Types, 'marqeta/types'
end
