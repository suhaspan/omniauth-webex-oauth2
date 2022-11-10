require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class Webex < OmniAuth::Strategies::OAuth2
      option :name, 'webex'

      option :client_options, {
        authorize_url: 'https://webexapis.com/v1/authorize',
        token_url: 'https://webexapis.com/v1/access_token'
      }

      uid { raw_info['id'] }

      info do
        {
          'email' => raw_info['emails'].first,
          'nickname' => raw_info['nickName'],
          'first_name' => raw_info['firstName'],
          'last_name' => raw_info['lastName'],
          'phone' => raw_info['phoneNumbers'].first
        }
      end

      extra do
        {
          'raw_info' => raw_info,
          'params' => access_token.params
        }
      end

      def raw_info
        @raw_info ||= access_token.get("https://webexapis.com/v1/people/me").parsed
      end

      def callback_url
        full_host + callback_path
      end
    end
  end
end