require 'oauth'
require 'builder'
require "rexml/document"
require 'cgi'
require 'securerandom'

module IMS # :nodoc:

  # :main:IMS::LTI1_1
  # LTI is a standard defined by IMS for creating eduction Tool Consumers/Providers.
  # LTI documentation: http://www.imsglobal.org/lti/index.html
  #
  # When creating these tools you will work primarily with the ToolProvider and
  # ToolConsumer classes.
  #
  # For validating OAuth request be sure to require the necessary proxy request
  # object. See IMS::LTI1_1::RequestValidator#valid_request? for more documentation.
  #
  # == Installation
  # This is packaged as the `ims-lti` rubygem, so you can just add the dependency to
  # your Gemfile or install the gem on your system:
  #
  #    gem install ims-lti
  #
  # To require the library in your project:
  #
  #    require 'ims/lti1_1'
  module LTI1_1

    # The versions of LTI this library supports
    VERSIONS = %w{1.0 1.1}

    class InvalidLTIConfigError < StandardError
    end

    class XMLParseError < StandardError
    end

    # POST a signed oauth request with the given key/secret/data
    def self.post_service_request(key, secret, url, content_type, body)
      raise IMS::LTI1_1::InvalidLTIConfigError, "" unless key && secret

      consumer = OAuth::Consumer.new(key, secret)
      token = OAuth::AccessToken.new(consumer)
      token.post(
              url,
              body,
              'Content-Type' => content_type
      )
    end

    # Generates a unique identifier
    def self.generate_identifier
      SecureRandom.uuid
    end
  end
end

require 'ims/lti1_1/extensions'
require 'ims/lti1_1/launch_params'
require 'ims/lti1_1/request_validator'
require 'ims/lti1_1/tool_base'
require 'ims/lti1_1/deprecated_role_checks'
require 'ims/lti1_1/role_checks'
require 'ims/lti1_1/tool_provider'
require 'ims/lti1_1/tool_consumer'
require 'ims/lti1_1/outcome_request'
require 'ims/lti1_1/outcome_response'
require 'ims/lti1_1/tool_config'
