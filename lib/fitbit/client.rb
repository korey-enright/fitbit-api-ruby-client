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
  end
end
