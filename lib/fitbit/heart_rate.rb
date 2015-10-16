module Fitbit
  class Client
    def heart_rate_time_series(user_id: '-', date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/activities/heart/date/#{base_date}/#{end_date}.json")
      else

      end
    end
  end
end
