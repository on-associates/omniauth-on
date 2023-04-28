# frozen_string_literal: true

require_relative "on/version"
require 'omniauth-oauth2'


module OmniAuth
  module Strategies
    class On < OmniAuth::Strategies::OAuth2
      option :name, 'on'

      option :client_options, {
        :site => ENV['VANTAGE_OAUTH_APP_SITE'] || "http://localhost:5000",
        :authorize_url => ENV['VANTAGE_OAUTH_APP_AUTHORIZE_URL']  || "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"],
          :name => raw_info["name"],
          :department => raw_info['department']
          # and anything else you want to return to your API consumers
        }
      end

      extra do
        skip_info? ? {} : { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
