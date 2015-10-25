module Fitbit
  class Client
    def initialize(client_id, client_secret, access_token)
      client = OAuth2::Client.new(client_id, client_secret)
      opts = {:authorize_url    => 'https://www.fitbit.com/oauth2/authorize',
              :token_url        => 'https://api.fitbit.com/oauth2/token',
              :token_method     => :post,
              :connection_opts  => {},
              :max_redirects    => 5,
              :raise_errors     => true}
      @access_token = OAuth2::AccessToken.new(client, access_token, opts)
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

      def post(uri, opts)
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
