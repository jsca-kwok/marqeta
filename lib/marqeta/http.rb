# frozen_string_literal: true

module Marqeta
  module HTTP
    class << self
      def basic_auth
        [Configuration.config.username, Configuration.config.password]
      end

      def handle_response(response)
        JSON.parse(response.body)
      rescue JSON::ParserError => e
        { 'error' => e.message }
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
