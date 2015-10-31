module Fitbit
  class Client

    # @overload body_fat_logs(date:)
    #   @param [String] date: The date to retrieve body fat
    # @overload body_fat_logs(date:, period)
    #   @param [String] date: The date to retrieve body fat
    #   @param [String] period: The period to retrieve body fat
    # @overload body_fat_logs(date:, period)
    #   @param [String] base_date: The base date to retrieve body fat
    #   @param [String] end_date: The end date to retrieve body fat
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

    def log_body_fat(user_id: '-', fat:, date:, time: nil)
      opts = {fat: fat, date: date, time: time}
      post("#{API_URI}/user/#{user_id}/body/log/fat.json", opts)
    end

    def delete_body_fat_log(user_id: '-', log_id:)
      delete("#{API_URI}/user/#{user_id}/body/log/fat/#{log_id}.json")
    end

    def body_fat_time_series(user_id: '-', date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{base_date}/#{end_date}.json")
      else
        raise StandardError
      end
    end

    def body_goals(user_id: '-', goal_type:)
      return get("#{API_URI}/user/#{user_id}/body/log/#{goal_type}/goal.json")
    end

    def update_body_fat_goal(user_id: '-', fat:)
      opts = {fat: fat}
      post("#{API_URI}/user/[user-id]/body/log/fat/goal.json", opts)
    end

    def update_weight_goal(user_id: '-', start_date:, start_weight:, weight: nil)
      opts = {startDate: start_date, startWeight: start_weight, weight: weight}
      post("#{API_URI}/user/#{user_id}/body/log/weight/goal.json", opts)
    end

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

    def log_weight(user_id: '-', weight:, date:, time: nil)
      opts = {weight: weight, date: date, time: time}
      post("#{API_URI}/user/#{user_id}/body/log/weight.json", opts)
    end

    def delete_weight_log(user_id: '-', log_id:)
      delete("#{API_URI}/user/#{user_id}/body/log/weight/#{log_id}.json")
    end
  end
end
