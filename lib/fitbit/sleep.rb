module Fitbit
  class Client
    # @param [String] user_id: User ID
    # @param [String] date: Date
    # @return [Hash] response data from Fitbit API
    def sleep_logs(user_id: '-', date: Date.today)
      return get("#{API_URI}/user/#{user_id}/sleep/date/#{date}.json")
    end

    # @overload sleep_time_series(date:, period:)
    #   @param [String] date: The date to retrieve body fat
    #   @param [String] period: The period to retrieve body fat
    # @overload sleep_time_series(base_date:, end_date:)
    #   @param [String] base_date: The base date to retrieve body fat
    #   @param [String] end_date: The end date to retrieve body fat
    # @return [Hash] response data from Fitbit API
    def sleep_time_series(user_id: '-', resource_path:, date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end

    # @param [String] start_time: start time
    # @param [String] duration: duration
    # @param [String] date
    # @return [Hash] response data from Fitbit API
    def log_sleep(user_id: '-', start_time:, duration:, date:)
      opts = {startTime: start_time, duration: duration, date: date}
      post("#{API_URI}/user/#{user_id}/sleep.json", opts)
    end

    # @param [String] log_id: Log ID
    # @return [Hash] response data from Fitbit API
    def delete_sleep_log(user_id: '-', log_id:)
      delete("#{API_URI}/user/#{user_id}/sleep/#{log_id}.json")
    end
  end
end
