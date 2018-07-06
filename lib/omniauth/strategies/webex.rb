require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class Webex < OmniAuth::Strategies::OAuth2
      option :name, 'webex'

      option :client_options, {
        authorize_url: 'https://api.ciscospark.com/v1/authorize',
        token_url: 'https://api.ciscospark.com/v1/access_token'
      }

      def authorize_params
        options.authorize_params[:scope] = 'spark-compliance:memberships_read spark:all spark-compliance:memberships_write spark-admin:people_write spark-admin:roles_read spark-admin:organizations_read spark-compliance:events_read spark-compliance:rooms_read spark-compliance:team_memberships_read spark-compliance:messages_write spark:kms spark-compliance:team_memberships_write spark-compliance:teams_read spark-admin:licenses_read spark-compliance:messages_read spark-admin:people_read'
        super
      end

      def build_access_token
        Rails.logger.debug 'Omniauth build access token'
        options.token_params[:headers] = { 'Authorization' => basic_auth_header }
        super
      end

      def basic_auth_header
        'Basic '
      end
    end
  end
end