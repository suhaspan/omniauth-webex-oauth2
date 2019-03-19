require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class Webex < OmniAuth::Strategies::OAuth2
      option :name, 'webex'

      option :client_options, {
        site: 'https://api.ciscospark.com/',
        authorize_url: '/v1/authorize',
        token_url: '/v1/access_token'
      }
      uid { raw_info['id'] }

      info do
        {
          name: raw_info['displayName'],
          email: raw_info['emails'].try(:first),
          nickname: raw_info['nickName'],
          organization_id: raw_info['orgId'],
          phone_numbers: raw_info['phoneNumbers']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def build_access_token
        Rails.logger.debug 'Omniauth build access token'
        options.token_params[:headers] = { 'Authorization' => basic_auth_header }
        super
      end

      def basic_auth_header
        'Basic '
      end

      def callback_url
        ENV.fetch('WEBEX_REDIRECT_URI')
      end

      def raw_info
        @raw_info ||= access_token.get('v1/people/me').parsed
      end
    end
  end
end