module Fitbit
  class Client
    attr_accessor :access_token

    # Returns a new instance of Client
    # @param [String] client_id: OAuth2 client id.
    # @param [String] client_secret: OAuth2 client secret.
    # @param [String] token: OAuth2 access token.
    # @param [String] refresh_token: OAuth2 refresh token.
    # @param [FixNum, String] expires_at: OAuth2 expires at.
    def initialize(client_id:, client_secret:, token:, refresh_token:, expires_at:)
      @basic_token = Base64.strict_encode64("#{client_id}:#{client_secret}")

      @oauth2_client = OAuth2::Client.new(client_id, client_secret,
        authorize_url: 'https://www.fitbit.com/oauth2/authorize',
        token_url: 'https://api.fitbit.com/oauth2/token')

      opts = { refresh_token: refresh_token,
               expires_at: expires_at }
      @access_token = OAuth2::AccessToken.new(@oauth2_client, token, opts)
    end

    def refresh!
      http_client = Faraday.new(url: 'https://api.fitbit.com')
      response = http_client.post do |request|
        request.url '/oauth2/token'
        request.headers['Authorization'] = "Basic #{@basic_token}"
        request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        request.body = { grant_type: 'refresh_token', refresh_token: @access_token.refresh_token }
      end
      response = JSON.parse(response.body)

      opts = { refresh_token: response['refresh_token'],
               expires_in: response['expires_in'] }
      @access_token = OAuth2::AccessToken.new(@oauth2_client, response['access_token'], opts)
    end

    private
      def get(uri)
        begin
          response = @access_token.get(uri)
          return JSON.parse(response.body)
        rescue => e
          return e
        end
      end

      def post(uri, opts: nil)
        begin
          response = @access_token.post(uri, {body: opts})
          return JSON.parse(response.body)
        rescue => e
          return e
        end
      end

      def delete(uri, opts: nil)
        begin
          response = @access_token.delete(uri, {body: opts})
          return response
        rescue => e
          return e
        end
      end
  end
end
