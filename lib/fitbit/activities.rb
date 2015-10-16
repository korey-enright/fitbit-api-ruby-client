module Fitbit
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
  end
end
