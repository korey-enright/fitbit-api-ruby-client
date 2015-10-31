module Fitbit
  class Client
    # @overload heart_rate_time_series(date:, period)
    #   @param [String] date: date
    #   @param [String] period: period
    # @overload heart_rate_time_series(base_date:, end_date:)
    #   @param [String] base_date: base date
    #   @param [String] end_date: end date
    # @return [Hash] response data from Fitbit API
    def heart_rate_time_series(user_id: '-', date: nil, period: nil, base_date: nil, end_date: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end

    # @overload heart_rate_intraday_time_series(base_date:, end_date: detail_level:)
    #   @param [String] base_date: base date
    #   @param [String] end_date: end date
    #   @param [String] detail_level: detail level
    # @overload heart_rate_intraday_time_series(base_date:, end_date: start_time: end_time:, detail_level:)
    #   @param [String] base_date: base date
    #   @param [String] end_date: end date
    #   @param [String] start_time: start time
    #   @param [String] end_time: end time
    #   @param [String] detail_level: detail level
    # @overload heart_rate_intraday_time_series(date:, detail_level:)
    #   @param [String] date: date
    #   @param [String] detail_level: detail level
    # @overload heart_rate_intraday_time_series(date: start_time: end_time:, detail_level:)
    #   @param [String] date: date
    #   @param [String] start_time: start time
    #   @param [String] end_time: end time
    #   @param [String] detail_level: detail level
    # @return [Hash] response data from Fitbit API
    def heart_rate_intraday_time_series(user_id: '-', date: nil, base_date: nil, end_date: nil, start_time: nil, end_time: nil, detail_level: nil)
      if base_date and end_date and detail_level and start_time and end_time
        return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{base_date}/#{end_date}/#{detail_level}/time/#{start_time}/#{end_time}.json")
      elsif base_date and end_date and detail_level
        return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{base_date}/#{end_date}/#{detail_level}.json")
      elsif date and detail_level and start_time and end_time
        return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{date}/1d/#{detail_level}/time/#{start_time}/#{end_time}.json")
      elsif date and detail_level
        return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{date}/1d/#{detail_level}.json")
      else
        raise StandardError
      end
    end
  end
end
