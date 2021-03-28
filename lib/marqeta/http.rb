# frozen_string_literal: true

module Marqeta
  module HTTP
    class BadRequestError < StandardError; end

    class ServerError < StandardError; end

    class ResponseParsingError < StandardError; end

    APPLICATION_JSON_CONTENT_TYPE = 'application/json'

    class << self
      def basic_auth
        [Configuration.config.username, Configuration.config.password].freeze
      end

      def handle_response(response)
        case response.code.to_i
        when 200, 201, 206
          JSON.parse(response.body)
        when 400
          raise BadRequestError, response.body
        when 500
          raise ServerError, response.body
        end
      rescue JSON::ParserError
        raise ResponseParsingError
      end

      def requester(uri:, request:)
        request.basic_auth(*basic_auth)

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end

        handle_response(response)
      end

      def get(endpoint:, query: {})
        uri = URI(Configuration.config.base_url + endpoint)
        uri.query = URI.encode_www_form(query)

        requester(uri: uri, request: Net::HTTP::Get.new(uri))
      end

      def post(endpoint:, params: {})
        uri = URI(Configuration.config.base_url + endpoint)
        request = Net::HTTP::Post.new(uri)
        request.body = params.to_json
        request.content_type = APPLICATION_JSON_CONTENT_TYPE

        requester(uri: uri, request: request)
      end

      def put(endpoint:, params: {})
        uri = URI(Configuration.config.base_url + endpoint)
        request = Net::HTTP::Put.new(uri)
        request.body = params.to_json
        request.content_type = APPLICATION_JSON_CONTENT_TYPE

        requester(uri: uri, request: request)
      end

      def delete(endpoint:)
        uri = URI(Configuration.config.base_url + endpoint)
        request = Net::HTTP::Delete.new(uri)
        request.content_type = APPLICATION_JSON_CONTENT_TYPE

        requester(uri: uri, request: request)
      end
    end
  end
end
