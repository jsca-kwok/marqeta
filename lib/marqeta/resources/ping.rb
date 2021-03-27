# frozen_string_literal: true

require 'marqeta/resources/base'
require 'marqeta/types/ping'

module Marqeta
  module Resources
    class Ping < Base
      set_path '/ping'
      set_type Marqeta::Types::Ping
    end
  end
end
