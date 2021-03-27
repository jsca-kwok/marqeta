# frozen_string_literal: true

require 'pry'

module Marqeta
  module Resources
    class Base
      extend Dry::Configurable

      setting(:path)
      setting(:fields, [])
      setting(:default_pagination, 1_000_000)
      setting(:has_collection, false)

      class << self
        Base.settings.each do |setting_name|
          define_method(setting_name) { config.send(setting_name) }
        end

        def all
          response = HTTP.get(endpoint: self.path, query: { count: config.default_pagination })

          if has_collection
            response["data"].map {|data| new(data) }
          else
            new(response)
          end
        end

        def find(token)
          response = HTTP.get(endpoint: self.path + "/#{token}")

          new(response)
        end

        def create
        end

        protected

        Base.settings.each do |setting_name|
          define_method("set_#{setting_name}") do |value|
            config.send("#{setting_name}=", value)
            config.send(setting_name)
          end
        end
      end

      attr_reader *self.fields

      def initialize(response)
        self.class.fields.each do |field|
          instance_variable_set("@#{field}", response[field.to_s])
        end
      end
    end
  end
end
