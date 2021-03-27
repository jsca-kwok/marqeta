# frozen_string_literal: true

require 'marqeta/types/base_type'

module Marqeta
  module Types
    class SharedTypes < BaseType
      UserStatuses = String.default('ACTIVE').enum('ACTIVE')
      Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    end
  end
end
