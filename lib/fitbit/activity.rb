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
        raise StandardError
      end
    end

    def activity_intraday_time_series(user_id: '-', resource_path:, date: nil, base_date: nil, end_date: nil, start_time: nil, end_time: nil, detail_level: nil)
      if base_date and end_date and detail_level and start_time and end_time
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}/#{detail_level}/time/#{start_time}/#{end_time}.json")
      elsif base_date and end_date and detail_level
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}/#{detail_level}.json")
      elsif date and detail_level and start_time and end_time
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{date}/1d/#{detail_level}/time/#{start_time}/#{end_time}.json")
      elsif date and detail_level
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{date}/1d/#{detail_level}.json")
      else
        raise StandardError
      end
    end

    def log_activity(user_id: '-', activity_id: nil, activity_name: nil, manual_calories: nil, start_time:, duration_millis:, date:, distance: nil, distance_unit: nil)
      opts = {activityId: activity_id, activityName: activity_name, manualCalories: manual_calories, startTime: start_time, durationMillis: duration_millis, date: date, distance: distance, distanceUnit: distance_unit}
      post("#{API_URI}/user/#{user_id}/activities.json", opts)
    end

    def delete_activity_log(user_id: '-', log_id:)
      delete("#{API_URI}/user/#{user_id}/activities/#{log_id}.json")
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

    def activity_type(activity_id:)
      return get("#{API_URI}/activities/#{activity_id}.json")
    end

    def frequent_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/frequent.json")
    end

    def recent_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/recent.json")
    end

    def favorite_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/favorite.json")
    end

    def add_favorite_activity(user_id: '-', activity_id:)
      return post("#{API_URI}/user/#{user_id}/activities/favorite/#{activity_id}.json")
    end

    def delete_favorite_activity(user_id: '-', activity_id)
      return delete("#{API_URI}/user/#{user_id}/activities/favorite/#{activity_id}.json")
    end

    def activity_goals(user_id: '-', period:)
      return get("#{API_URI}/user/#{user_id}/activities/goals/#{period}.json")
    end

    def update_activity_goals(user_id: '-', period:, calories_out: nil, active_minutes: nil, floors: nil, distance: nil, steps: nil)
      opts = {caloriesOut: calories_out, activeMinutes: active_minutes, floors: floors, distance: distance, steps: steps}
      return post("#{API_URI}/user/#{user_id}/activities/goals/#{period}.json", opts)
    end

    def lifetime_stats(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities.json")
    end
  end
end
