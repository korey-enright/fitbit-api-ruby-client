module Fitbit
  class Client
    def body_fat(user_id: '-', date: Date.today)
      return get("/user/#{user_id}/body/log/fat/date/#{date}.json")
    end

    def body_fat_time_series(user_id: '-', date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/body/log/fat/date/#{base_date}/#{end_date}.json")
      else

      end
    end

    def body_goals(user_id: '-', goal_type:)
      return get("/user/#{user_id}/body/log/#{goal_type}/goal.json")
    end

    def weight(user_id: '-', date: Date.today)
      return get("/user/#{user_id}/body/log/weight/date/#{date}.json")
    end

    def body_weight_time_series(user_id: '-', date: nil, period: nil, base_date: nil, end_data: nil)
      if date and period
        return get("#{API_URI}/user/#{user_id}/body/log/weight/date/#{date}/#{period}.json")
      elsif base_date and end_date
        return get("#{API_URI}/user/#{user_id}/body/log/weight/date/#{base_date}/#{end_date}.json")
      else

      end
    end
  end
end
