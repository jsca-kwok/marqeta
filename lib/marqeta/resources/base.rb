# frozen_string_literal: true

module Marqeta
  module Resources
    class Base
      extend Dry::Configurable

      setting(:path)
      setting(:default_pagination, 1_000_000)
      setting(:has_collection, false)
      setting(:type)

      class << self
        Base.settings.each do |setting_name|
          define_method(setting_name) { config.send(setting_name) }
        end

        def class_type
          self.config.type
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
          new(HTTP.get(endpoint: path + "/#{token}"))
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

      def initialize(response = {})
        self.class.class_type.schema.keys.each do |field|
          singleton_class.send(:attr_accessor, field.name)
          value = response[field.name.to_s] || response[field.name] || (field.respond_to?(:value) && field.value)
          instance_variable_set("@#{field.name.to_s}", value)
        end
      end

      def to_h
        hash = {}

        self.class.class_type.schema.keys.each do |field|
          hash[field] = instance_variable_get("@#{field.to_s}")
        end

        hash
      end
      alias_method :to_hash, :to_h

      def valid?
        validator = self.class.class_type
        validator.new(self.to_h)
        return true
      end
    end
  end
end
