module Fitbit
  class Client
    # The Get Body Fat Logs API retrieves a list of all user's body fat log entries for a given
    # day in the format requested. Body fat log entries are available only to authorized user.
    # If you need to fetch only the most recent entry, you can use the Get Body Measurements
    # endpoint.
    # @overload body_fat_logs(user_id: '-', date:)
    #   @param [String] user_id: The encoded ID of the user. Use "-" (dash) for current logged-in user.
    #   @param [String] date: The date in the format yyyy-MM-dd.
    # @overload body_fat_logs(user_id: '-', date:, period:)
    #   @param [String] user_id: The encoded ID of the user. Use "-" (dash) for current logged-in user.
    #   @param [String] date: The date in the format yyyy-MM-dd.
    #   @param [String] period: The period to retrieve body fat
    # @overload body_fat_logs(user_id: '-', base_date:, end_date:)
    #   @param [String] user_id: The encoded ID of the user. Use "-" (dash) for current logged-in user.
    #   @param [String] base_date: The end date when period is provided; range start date when a date range is provided. In the format yyyy-MM-dd or today.
    #   @param [String] end_date: Range end date when date range is provided. Note: The range should not be longer than 31 days.
    # @return [Hash] response data from Fitbit API
    def body_fat_logs(user_id: '-', date: nil, period: nil, base_date: nil, end_date: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{date}/#{period}.json")
      elsif date
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{date}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def log_body_fat(user_id: '-', fat:, date:, time: nil)
      opts = {fat: fat, date: date, time: time}
      post("#{API_URI}/user/#{user_id}/body/log/fat.json", opts)
    end

    # @param [String] user_id: User ID
    # @param [String] log_id: Fat Log ID to delete
    # @return [Object] response data from Fitbit API
    def delete_body_fat_log(user_id: '-', log_id:)
      delete("#{API_URI}/user/#{user_id}/body/log/fat/#{log_id}.json")
    end

    # @overload body_fat_time_series(date:, period:)
    #   @param [String] date: The date to retrieve body fat
    #   @param [String] period: The period to retrieve body fat
    # @overload body_fat_time_series(base_date:, end_date:)
    #   @param [String] base_date: The base date to retrieve body fat
    #   @param [String] end_date: The end date to retrieve body fat
    # @return [Hash] response data from Fitbit API
    def body_fat_time_series(user_id: '-', date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end

    # @param [String] user_id: User ID
    # @param [String] goal_type: goal type
    # @return [Hash] response data from Fitbit API
    def body_goals(user_id: '-', goal_type:)
      return get("#{API_URI}/user/#{user_id}/body/log/#{goal_type}/goal.json")
    end

    # @param [String] user_id: User ID
    # @param [String] fat: body fat value
    # @return [Hash] response data from Fitbit API
    def update_body_fat_goal(user_id: '-', fat:)
      opts = {fat: fat}
      post("#{API_URI}/user/[user-id]/body/log/fat/goal.json", opts)
    end

    # @param [String] user_id: User ID
    # @param [String] start_date: start date
    # @param [String] start_weight: start weight
    # @param [String] weight: weight
    # @return [Hash] response data from Fitbit API
    def update_weight_goal(user_id: '-', start_date:, start_weight:, weight: nil)
      opts = {startDate: start_date, startWeight: start_weight, weight: weight}
      post("#{API_URI}/user/#{user_id}/body/log/weight/goal.json", opts)
    end

    # @overload weight_logs(date:)
    #   @param [String] date: The date to retrieve weight
    # @overload weight_logs(date:, period:)
    #   @param [String] date: The date to retrieve weight
    #   @param [String] period: The period to retrieve weight
    # @overload weight_logs(base_date:, end_date:)
    #   @param [String] base_date: The base date to retrieve weight
    #   @param [String] end_date: The end date to retrieve weight
    # @return [Hash] response data from Fitbit API
    def weight_logs(user_id: '-', date: nil, period: nil, base_date: nil, end_date: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/body/log/weight/date/#{date}/#{period}.json")
      elsif date
        return get("#{API_URI}/user/#{user_id}/body/log/weight/date/#{date}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/body/log/weight/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end

    # @param [String] user_id: User ID
    # @param [String] weight: weight
    # @param [String] date: date
    # @param [String] time: time
    # @return [Hash] response data from Fitbit API
    def log_weight(user_id: '-', weight:, date:, time: nil)
      opts = {weight: weight, date: date, time: time}
      post("#{API_URI}/user/#{user_id}/body/log/weight.json", opts)
    end

    # @param [String] user_id: User ID
    # @param [String] log_id: Log ID
    # @return [Hash] response data from Fitbit API
    def delete_weight_log(user_id: '-', log_id:)
      delete("#{API_URI}/user/#{user_id}/body/log/weight/#{log_id}.json")
    end
  end
end
