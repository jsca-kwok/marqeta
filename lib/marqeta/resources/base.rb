# frozen_string_literal: true

require 'pry'

module Marqeta
  module Resources
    class Base
      extend Dry::Configurable
      Types = Dry::Types()

      setting(:path)
      setting(:fields, [])
      setting(:default_pagination, 1_000_000)
      setting(:has_collection, false)
      setting(:validator)

      class << self
        Base.settings.each do |setting_name|
          define_method(setting_name) { config.send(setting_name) }
        end

        def all
          response = HTTP.get(endpoint: path, query: { count: config.default_pagination })

          if has_collection
            response['data'].map { |data| new(data) }
          else
            new(response)
          end
        end

        def find(token)
          response = HTTP.get(endpoint: path + "/#{token}")

          new(response)
        end

        def create; end

        protected

        Base.settings.each do |setting_name|
          define_method("set_#{setting_name}") do |value|
            config.send("#{setting_name}=", value)
            config.send(setting_name)
          end
        end
      end

      attr_reader :errors

      def initialize(response = {})
        @errors = {}
        self.class.fields.each do |field|
          singleton_class.send(:attr_accessor, field)
          instance_variable_set("@#{field}", response[field.to_s] || response[field])
        end
      end

      def to_h
        hash = {}

        self.class.config.fields.each do |field|
          hash[field] = instance_variable_get("@#{field.to_s}")
        end

        hash
      end

      def valid?
        validator = self.class.config.validator

        if validator
          schema = validator.new.call(self.to_h)
          set_errors(schema.errors.to_h)
          return false if @errors.any?
        end

        set_errors({})
        return true
      end

      protected

      def set_errors(errors = {})
        @errors = errors
      end
    end
  end
end
