module Fitbit
  class Client
    def devices(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/devices.json")
    end

    def alarms(user_id: '-', tracker_id:)
      return get("#{API_URI}/user/#{user_id}/devices/tracker/#{tracker_id}/alarms.json")
    end
  end
end
