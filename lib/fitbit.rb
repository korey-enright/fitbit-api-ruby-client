require 'fitbit/version'
require 'fitbit/client'
require 'oauth2'

module Fitbit
  API_URI = 'https://api.fitbit.com/1'

  class Client

    def activity(user_id: '-', date: Date.today)
      return get("#{API_URI}/user/#{user_id}/activities/date/#{date}.json")
    end

    def activity_time_series(user_id: '-', resource_path:, date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}.json")
      else

      end
    end

    def activity_intraday_time_series(resource_path:, base_date: nil, end_date: nil, detail_level: nil, date: nil, start_time: nil, end_time: nil)

    end

    def activity_logs_list(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/list.json")
    end

    def activity_tcx(user_id: '-', log_id:)
      return get("#{API_URI}/user/#{user_id}/activities/#{log_id}.tcx")
    end

    def activity_types
      return get("#{API_URI}/activities.json")
    end

    def activity_type(activity_type:)
      return get("#{API_URI}/activities/#{activity_type}.json")
    end

    def frequent_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/frequent.json")
    end

    def recent_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/recent.json")
    end

    def favorite_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/recent.json")
    end

    def activity_goals(user_id: '-', period:)
      return get("#{API_URI}/user/#{user_id}/activities/goals/#{period}.json")
    end

    def lifetime_stats(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities.json")
    end

    def body_fat(date: Date.today, user_id: '-')
      return get("/user/#{user_id}/body/log/fat/date/#{date}.json")
    end



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
