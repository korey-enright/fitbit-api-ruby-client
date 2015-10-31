module Fitbit
  class Client
    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def profile(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/profile.json")
    end

    # @param [Hash] opts: opts
    # @return [Hash] response data from Fitbit API
    def update_profile(user_id: '-', opts: {})
      return post("#{API_URI}/user/#{user_id}/profile.json", opts)
    end

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def badges(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/badges.json")
    end
  end
end
