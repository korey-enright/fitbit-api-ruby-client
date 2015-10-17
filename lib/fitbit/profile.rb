module Fitbit
  class Client
    def profile(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/profile.json")
    end

    def update_profile(user_id: '-', opts: {})
      return post("#{API_URI}/user/#{user_id}/profile.json", opts)
    end

    def badges(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/badges.json")
    end
  end
end
