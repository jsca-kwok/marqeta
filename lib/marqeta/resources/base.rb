# frozen_string_literal: true

module Marqeta
  module Resources
    class Base
      extend Dry::Configurable

      setting(:path)
      setting(:default_pagination, 1_000_000)
      setting(:has_collection, false)
      setting(:type)
      setting(:type_for, {})

      class << self
        Base.settings.each do |setting_name|
          define_method(setting_name) { config.send(setting_name) }
        end

        def class_type
          config.type
        end

        def update_payload(attributes)
          yield attributes
        end

        def all
          raise NoMethodError unless path

          response = HTTP.get(endpoint: path, query: { count: config.default_pagination })

          if has_collection
            response['data'].map { |data| new(data) }
          else
            new(response)
          end
        end

        def find(token)
          raise NoMethodError unless path

          new(HTTP.get(endpoint: path + "/#{token}"))
        end

        def create(attributes = {})
          raise NoMethodError unless path

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

        def set_type_for(field_name, type)
          config.type_for[field_name] = type
        end
      end

      attr_reader :errors

      def update(attributes = {})
        raise NoMethodError unless self.class.path

        return unless valid?

        attributes.merge!(to_hash)
        # Remove empty params

        response = HTTP.put(endpoint: "#{self.class.path}/#{token}", params: attributes)
        response.each do |key, value|
          send("#{key}=", value)
        rescue NoMethodError
          instance_variable_set("@#{key}", value)
        end

        self
      end

      def destroy
        raise NoMethodError unless self.class.path

        HTTP.delete(endpoint: "#{self.class.path}/#{token}")
        true
      end

      def initialize(response)
        response ||= {}
        define_attributes(response)
      end

      def to_h
        hash = {}

        self.class.class_type.schema.keys.each do |field|
          hash[field.name] = instance_variable_get("@#{field.name}")
        end

        # TODO: Refactor
        self.class.config.type_for.each do |field, value|
          child_relation = self.class.config.type_for[field]
          value = instance_variable_get("@#{field}")
          hash[field] = value&.to_h
        end

        hash
      end
      alias to_hash to_h

      def valid?
        clean_errors
        validator = self.class.class_type
        # TODO: Validate child fields
        validator.schema.each do |field|
          value = send(field.name)
          field[value]
        rescue StandardError => e
          add_error(field.name, e.message)
        end

        return false if errors.any?

        true
      end

      protected

      def add_error(key, message)
        @errors ||= {}
        @errors[key] = message
      end

      def clean_errors
        @errors = {}
      end

      def define_attributes(response)
        self.class.class_type.schema.keys.each do |field|
          singleton_class.send(:attr_accessor, field.name)
          value = response[field.name.to_s] || response[field.name]
          instance_variable_set("@#{field.name}", value)
        end

        # TODO: Refactor
        self.class.config.type_for.each do |field, child_class|
          singleton_class.send(:attr_accessor, field)
          child_relation = self.class.config.type_for[field]
          child_relation.class_type.schema.keys.each do |child_field|
            child_value = response[field.to_s] || response[field]
            instance_variable_set("@#{field}", child_class.new(child_value))
          end
        end
      end
    end
  end
end
