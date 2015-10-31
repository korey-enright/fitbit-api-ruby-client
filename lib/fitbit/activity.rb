module Fitbit
  class Client
    # @param [String] user_id: User ID
    # @param [String] date: Date
    # @return [Hash] response data from Fitbit API
    def activity(user_id: '-', date: Date.today)
      return get("#{API_URI}/user/#{user_id}/activities/date/#{date}.json")
    end

    # @overload activity_time_series(resource_path:, date:, period:)
    #   @param [String] resource_path: Resource path
    #   @param [String] date: Date
    #   @param [String] period: Period
    # @overload activity_time_series(resource_path:, base_date:, end_date:)
    #   @param [String] resource_path: Resource path
    #   @param [String] base_date: The base date to retrieve body fat
    #   @param [String] end_date: The end date to retrieve body fat
    # @return [Hash] response data from Fitbit API
    def activity_time_series(user_id: '-', resource_path:, date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end

    # @overload activity_intraday_time_series(resource_path:, base_date:, end_date:, detail_level:)
    #   @param [String] resource_path: Resource path
    #   @param [String] base_date: Base date
    #   @param [String] end_date: End date
    #   @param [String] detail_level: Detail level
    # @overload activity_intraday_time_series(resource_path:, base_date:, end_date:, start_time:, end_time:)
    #   @param [String] resource_path: Resource path
    #   @param [String] base_date: Base date
    #   @param [String] end_date: End date
    #   @param [String] start_time: Start time
    #   @param [String] end_time: End time
    #   @param [String] detail_level: Detail level
    # @overload activity_intraday_time_series(resource_path:, date:, detail_level:)
    #   @param [String] resource_path: Resource path
    #   @param [String] date: date
    #   @param [String] detail_level: Detail level
    # @overload activity_intraday_time_series(resource_path:, date:, start_time:, end_time:, detail_level:)
    #   @param [String] resource_path: Resource path
    #   @param [String] date: date
    #   @param [String] start_time: start time
    #   @param [String] end_time: end time
    #   @param [String] detail_level: Detail level
    # @return [Hash] response data from Fitbit API
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

    # @param [String] activity_id: Activity ID
    # @param [String] atctivity_name: Activity name
    # @param [String] manual_calories: manual calories
    # @param [String] start_time: start time
    # @param [String] duration_millis: duration millis
    # @param [String] date: date
    # @param [String] distance_unit: distance unit
    # @return [Hash] response data from Fitbit API
    def log_activity(user_id: '-', activity_id: nil, activity_name: nil, manual_calories: nil, start_time:, duration_millis:, date:, distance: nil, distance_unit: nil)
      opts = {activityId: activity_id, activityName: activity_name, manualCalories: manual_calories, startTime: start_time, durationMillis: duration_millis, date: date, distance: distance, distanceUnit: distance_unit}
      post("#{API_URI}/user/#{user_id}/activities.json", opts)
    end

    # @param [String] log_id: Log ID
    # @return [Hash] response data from Fitbit API
    def delete_activity_log(user_id: '-', log_id:)
      delete("#{API_URI}/user/#{user_id}/activities/#{log_id}.json")
    end

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def activity_logs_list(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/list.json")
    end

    # @param [String] log_id: Log ID
    # @return [Hash] response data from Fitbit API
    def activity_tcx(user_id: '-', log_id:)
      return get("#{API_URI}/user/#{user_id}/activities/#{log_id}.tcx")
    end

    # @return [Hash] response data from Fitbit API
    def activity_types
      return get("#{API_URI}/activities.json")
    end

    # @param [String] activity_id: Activity ID
    # @return [Hash] response data from Fitbit API
    def activity_type(activity_id:)
      return get("#{API_URI}/activities/#{activity_id}.json")
    end

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def frequent_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/frequent.json")
    end

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def recent_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/recent.json")
    end

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def favorite_activities(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities/favorite.json")
    end

    # @param [String] activity_id: Activity ID
    # @return [Hash] response data from Fitbit API
    def add_favorite_activity(user_id: '-', activity_id:)
      return post("#{API_URI}/user/#{user_id}/activities/favorite/#{activity_id}.json")
    end

    # @param [String] activity_id: Activity ID
    # @return [Hash] response data from Fitbit API
    def delete_favorite_activity(user_id: '-', activity_id)
      return delete("#{API_URI}/user/#{user_id}/activities/favorite/#{activity_id}.json")
    end

    # @param [String] period: period
    # @return [Hash] response data from Fitbit API
    def activity_goals(user_id: '-', period:)
      return get("#{API_URI}/user/#{user_id}/activities/goals/#{period}.json")
    end

    # @param [String] period: period
    # @param [String] calories_out: calories out
    # @param [String] active_minutes: active minutes
    # @param [String] floors: floors
    # @param [String] distance: distance
    # @param [String] steps: steps
    # @return [Hash] response data from Fitbit API
    def update_activity_goals(user_id: '-', period:, calories_out: nil, active_minutes: nil, floors: nil, distance: nil, steps: nil)
      opts = {caloriesOut: calories_out, activeMinutes: active_minutes, floors: floors, distance: distance, steps: steps}
      return post("#{API_URI}/user/#{user_id}/activities/goals/#{period}.json", opts)
    end

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def lifetime_stats(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/activities.json")
    end
  end
end
