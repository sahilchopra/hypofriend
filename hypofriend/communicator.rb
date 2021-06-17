# Hypofriend::Communicator
module Hypofriend
  class Communicator
    attr_reader :params, :path

    def initialize(params:, path:)
      @params = params
      @path = path
    end

    def call
      request.run
    end

    def http_method
      :get
    end

    def url
      URI.join base_url, path
    end

    def base_url
      'https://offer-v3.hypofriend.de/'
    end

    private

    def request
      Typhoeus::Request.new(
        url,
        method: http_method,
        body: JSON.dump(params),
        headers: {
          'Content-Type' => 'application/json'
        }
      )
    end
  end
end
