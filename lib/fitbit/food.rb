module Fitbit
  class Client
    FOOD_API_VERSION='1'

    # The Get Food Logs endpoint returns a summary and list of a user's food log entries
    # for a given day in the format requested. The
    # endpoint response includes summary for all food log entries for the given day (including
    # naps.)
    # @param [String] user_id: The encoded ID of the user. Use "-" (dash) for current logged-in user.
    # @param [String] date: The date of records to be returned. In the format yyyy-MM-dd.
    # @return [Hash] response data from Fitbit API
    def food_logs(user_id: '-', date: Date.today)
      return get("#{API_URI}/#{FOOD_API_VERSION}/user/#{user_id}/foods/log/date/#{date}.json")
    end

    # given resource in the format requested using units in the
    # {https://dev.fitbit.com/docs/basics/#units unit system} that corresponds to the
    # Accept-Language header provided.
    # @overload sleep_time_series(date:, period:)
    #   @param [String] user_id: The encoded ID of the user. Use "-" (dash) for current logged-in user.
    #   @param [String] resource_path: The resource path; see the Resource Path Options below for a list of options.
    #   @param [String] date: The end date of the period specified in the format yyyy-MM-dd or today.
    #   @param [String] period: The range for which data will be returned. Options are 1d, 7d, 30d, 1w, 1m, 3m, 6m, 1y, or max.
    # @overload sleep_time_series(base_date:, end_date:)
    #   @param [String] user_id: The encoded ID of the user. Use "-" (dash) for current logged-in user.
    #   @param [String] resource_path: The resource path; see the Resource Path Options below for a list of options.
    #   @param [String] base_date: The range start date, in the format yyyy-MM-dd or today.
    #   @param [String] end_date: The end date of the range.
    # @return [Hash] response data from Fitbit API
    def food_time_series(user_id: '-', resource_path:, date: nil, period: nil, base_date: nil, end_date: nil)
      if date and period
        return get("#{API_URI}/#{FOOD_API_VERSION}/user/#{user_id}/#{resource_path}/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/#{FOOD_API_VERSION}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end
  end
end
