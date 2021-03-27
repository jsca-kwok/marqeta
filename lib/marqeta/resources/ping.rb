# frozen_string_literal: true

require 'marqeta/resources/base'
require 'marqeta/types/ping_type'

module Marqeta
  module Resources
    class Ping < Base
      set_path '/ping'
      set_type Marqeta::Types::PingType
    end
  end
end
