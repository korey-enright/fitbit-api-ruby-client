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
  end
end
