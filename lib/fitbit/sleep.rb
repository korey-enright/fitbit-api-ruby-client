module Fitbit
  class Client
    def sleep_logs(user_id: '-', date: Date.today)
      return get("#{API_URI}/user/#{user_id}/sleep/date/#{date}.json")
    end

    def sleep_time_series(user_id: '-', resource_path:, date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/#{resource_path}/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end

    def log_sleep(user_id: '-', start_time:, duration:, date:)
      opts = {startTime: start_time, duration: duration, date: date}
      post("#{API_URI}/user/#{user_id}/sleep.json", opts)
    end

    def delete_sleep_log(user_id: '-', log_id:)
      delete("#{API_URI}/user/#{user_id}/sleep/#{log_id}.json")
    end
  end
end
