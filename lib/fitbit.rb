require 'fitbit/version'
require 'oauth2'

module Fitbit
  API_URI = 'https://api.fitbit.com/1'

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

    def daily_activity(date = Date.today, user_id = '-')
      begin
        response = @access_token.get("#{API_URI}/user/#{user_id}/activities/date/#{date}.json")
      rescue
        return response
      end
      return @access_token
    end

    def activity_time_series_with_period(resource_path, date, period, user_id = '-')
      begin
        response = @access_token.get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{date}/#{period}.json")
      rescue
        return response
      end
      return JSON.parse(response.body)
    end

    def activity_time_series_with_date_range(resource_path, base_date, end_date, user_id = '-')
      begin
        response = @access_token.get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}.json")
      rescue
        return response
      end
      return JSON.parse(response.body)
    end

    def activity_logs_list(user_id = '-')
      begin
        response = @access_token.get("#{API_URI}/user/#{user_id}/activities/list.json")
      rescue
        return response
      end
      return JSON.parse(response.body)
    end

    def heart_rate_time_series_with_period(base_date = 'today', period = '1d', user_id = '-')
      begin
        response = @access_token.get("#{API_URI}/user/#{user_id}/activities/heart/date/#{date}/#{period}.json")
      rescue
        return response
      end
      return JSON.parse(response.body)
    end

    def heart_rate_time_series_with_date_range(base_date, end_date, user_id = '-')
      begin
        response = @access_token.get("#{API_URI}/user/#{user_id}/activities/heart/date/#{base_date}/#{end_date}.json")
      rescue
        return response
      end
      return JSON.parse(response.body)
    end

    def heart_rate_intraday_time_series(base_date = 'today', start_time = '00:00', end_date = 'today', end_time = '23:59', detail_level = '1min', user_id = '-')
      begin
        response = @access_token.get("#{API_URI}/user/#{user_id}/activities/heart/date/#{base_date}/#{end_date}/#{detail_level}/time/#{start_time}/#{end_time}.json")
      rescue
        return response
      end
      return JSON.parse(response.body)
    end
  end
end
