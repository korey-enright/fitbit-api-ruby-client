module Fitbit
  class Client
    def profile(user_id: '-')
      return get("/user/#{user_id}/profile.json")
    end

    def badges(user_id: '-')
      return get("/user/#{user_id}/badges.json")
    end
  end
end
