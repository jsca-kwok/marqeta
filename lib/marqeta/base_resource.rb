# frozen_string_literal: true

require 'marqeta/api_resource'

module Marqeta
  class BaseResource
    include ApiResource
    extend Dry::Configurable

    setting(:path)
    setting(:default_pagination, 1_000_000)
    setting(:has_collection, false)
    setting(:schema)
    setting(:schema_for, {})

    class << self
      BaseResource.settings.each do |setting_name|
        define_method(setting_name) { config.send(setting_name) }
      end

      def class_schema
        config.schema
      end

      protected

      BaseResource.settings.each do |setting_name|
        define_method("set_#{setting_name}") do |value|
          config.send("#{setting_name}=", value)
          config.send(setting_name)
        end
      end

      def set_schema_for(field_name, schema)
        config.schema_for[field_name] = schema
      end
    end

    attr_reader :errors

    def initialize(response = {})
      response ||= {}
      define_attributes(response)
    end

    def to_hash
      hash = {}

      self.class.class_schema.schema.rules.keys.each do |field|
        hash[field] = instance_variable_get("@#{field}")
      end

      # TODO: Refactor
      self.class.config.schema_for.each do |field, value|
        value = instance_variable_get("@#{field}")
        hash[field] = value&.to_hash
      end

      hash
    end
    alias to_h to_hash

    def valid?
      clean_errors
      validator = self.class.class_schema.schema.call(self.to_h)
      set_errors(validator.errors.to_hash)

      self.class.config.schema_for.each do |field, value|
        unless self.send(field).valid?
          errors = self.send(field).errors
          add_error(field, errors)
        end
      end

      return false if errors.any?

      true
    end

    protected

    def add_error(key, message)
      @errors ||= {}
      @errors[key] = message
    end

    def set_errors(hash)
      @errors = hash
    end

    def clean_errors
      @errors = {}
    end

    def define_attributes(response)
      self.class.class_schema.schema.rules.keys.each do |field|
        singleton_class.send(:attr_accessor, field)
        value = response[field.to_s] || response[field]
        instance_variable_set("@#{field}", value)
      end

      # TODO: Refactor
      self.class.config.schema_for.each do |field, child_class|
        singleton_class.send(:attr_accessor, field)
        child_relation = self.class.config.schema_for[field]
        child_relation.class_schema.schema.rules.keys.each do |_child_field|
          child_value = response[field.to_s] || response[field]
          instance_variable_set("@#{field}", child_class.new(child_value))
        end
      end
    end
  end
end
