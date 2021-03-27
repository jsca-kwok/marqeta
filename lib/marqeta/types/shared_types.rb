# frozen_string_literal: true

require 'marqeta/types/base_type'

module Marqeta
  module Types
    class SharedTypes < BaseType
      REGEX_PASSWORD = /^(?=.*\d.*\d)(?=.*[^A-Za-z\d]).{20,50}$/.freeze

      UserStatuses = String.default('ACTIVE').enum('ACTIVE')
      Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
      SafePassword = String.constrained(format: REGEX_PASSWORD)
    end
  end
end
