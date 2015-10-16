require 'fitbit/activities'
require 'fitbit/bodies'
require 'fitbit/client'
require 'fitbit/devices'
require 'fitbit/friends'
require 'fitbit/heart_rate'
require 'fitbit/profile'
require 'fitbit/version'
require 'oauth2'

module Fitbit
  API_URI = 'https://api.fitbit.com/1'

  class Client
    def heart_rate_time_series(date = Date.today, period = '1d', user_id = '-')
      return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{date}/#{period}.json")
    end

    def heart_rate_intraday_time_series(base_date = 'today', start_time = '00:00', end_date = 'today', end_time = '23:59', detail_level = '1min', user_id = '-')
      return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{base_date}/#{end_date}/#{detail_level}/time/#{start_time}/#{end_time}.json")
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
  end
end
