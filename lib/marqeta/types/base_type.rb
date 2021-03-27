# frozen_string_literal: true

module Marqeta
  module Types
    class BaseType < Dry::Struct
      include Dry::Types()
    end
  end
end
