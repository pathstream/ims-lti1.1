module IMS::LTI1_1
  class ToolBase
    include IMS::LTI1_1::Extensions::Base
    include IMS::LTI1_1::LaunchParams
    include IMS::LTI1_1::RequestValidator

    # OAuth credentials
    attr_accessor :consumer_key, :consumer_secret

    def initialize(consumer_key, consumer_secret, params={})
      @consumer_key = consumer_key
      @consumer_secret = consumer_secret
      @custom_params = {}
      @ext_params = {}
      @non_spec_params = {}
      process_params(params)
    end

    # Convenience method for doing oauth signed requests to services that
    # aren't supported by this library
    def post_service_request(url, content_type, body)
      IMS::LTI1_1::post_service_request(@consumer_key,
                                     @consumer_secret,
                                     url,
                                     content_type,
                                     body)
    end
  end
end