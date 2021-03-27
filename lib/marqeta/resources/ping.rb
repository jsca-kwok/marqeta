# frozen_string_literal: true

require 'marqeta/resources/base'

module Marqeta
  module Resources
    class Ping < Base
      set_path '/ping'
      set_fields %i(success version revision timestamp env id)
    end
  end
end
