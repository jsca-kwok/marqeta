# frozen_string_literal: true

require 'marqeta/types/base_type'

module Marqeta
  module Types
    class PingType < BaseType
      attribute :id, String
      attribute :env, String
      attribute :version, String
      attribute :revision, String
      attribute :timestamp, String
      attribute :success, Bool
    end
  end
end
