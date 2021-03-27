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
          config.type
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

        def create(attributes = {})
          response = HTTP.post(endpoint: path, params: attributes)

          new(response)
        end

        protected

        Base.settings.each do |setting_name|
          define_method("set_#{setting_name}") do |value|
            config.send("#{setting_name}=", value)
            config.send(setting_name)
          end
        end
      end

      def update(attributes = {})
        response = HTTP.put(endpoint: "#{self.class.path}/#{token}", params: to_h.merge(attributes))

        response.each do |key, value|
          send("#{key}=", value)
        rescue NoMethodError
          instance_variable_set("@#{key}", value)
        end

        self
      end

      def destroy
        HTTP.delete(endpoint: "#{self.class.path}/#{token}")
        true
      end

      def initialize(response)
        response ||= {}
        define_attributes(response)
      end

      def to_h
        hash = {}

        self.class.class_type.schema.each_key do |field|
          hash[field.name] = instance_variable_get("@#{field.name}")
        end

        hash
      end
      alias to_hash to_h

      def valid?
        validator = self.class.class_type
        validator.new(to_h)
        true
      end

      protected

      def define_attributes(response)
        self.class.class_type.schema.each_key do |field|
          singleton_class.send(:attr_accessor, field.name)
          value = response[field.name.to_s] || response[field.name] || (field.respond_to?(:value) && field.value)
          instance_variable_set("@#{field.name}", value)
        end
      end
    end
  end
end
