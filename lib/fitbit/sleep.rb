module Fitbit
  class Client
    def sleep(user_id: '-', date: Date.today)
      return get("#{API_URI}/user/#{user_id}/sleep/date/#{date}.json")
    end

    def sleep_time_series(user_id: '-', resource_path:, date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}.json")
      else

      end
    end
  end
end
