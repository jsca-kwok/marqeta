# frozen_string_literal: true

module Marqeta
  module ApiResource
    def self.included(base)
      base.extend(Marqeta::CollectionApiResources)
    end

    def update(attributes = {})
      raise NoMethodError unless self.class.path || token

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
  end

  module CollectionApiResources
    def all
      raise NoMethodError unless path

      response = HTTP.get(endpoint: path, query: { count: config.default_pagination })

      if has_collection
        # TODO: Create class that extends the Array and have pagination methods
        response['data'].map { |data| new(data) }
      else
        new(response)
      end
    end

    def find(token)
      raise NoMethodError unless path || token

      new(HTTP.get(endpoint: path + "/#{token}"))
    end

    def create(attributes = {})
      raise NoMethodError unless path

      instance = new(attributes)
      return false unless instance.valid?

      response = HTTP.post(endpoint: path, params: attributes)

      new(response)
    end
  end
end
