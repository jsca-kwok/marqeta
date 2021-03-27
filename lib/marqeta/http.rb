# frozen_string_literal: true

module Marqeta
  module HTTP
    class BadRequestError < StandardError; end
    class ServerError < StandardError; end
    class ResponseParsingError < StandardError; end

    class << self
      def basic_auth
        [Configuration.config.username, Configuration.config.password].freeze
      end

      def handle_response(response)
        case response.code.to_i
        when 200, 201
          JSON.parse(response.body)
        when 400
          raise BadRequestError
        when 500
          raise ServerError
        end
      rescue JSON::ParserError => e
        raise ResponseParsingError
      end

      def get(endpoint:, query: {})
        uri = URI(Configuration.config.base_url + endpoint)
        uri.query = URI.encode_www_form(query)

        request = Net::HTTP::Get.new(uri)
        request.basic_auth(*basic_auth)

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end

        handle_response(response)
      end
    end
  end
end
