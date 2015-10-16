module Fitbit
  class Client
    def friends(user_id: '-')
      return get("/user/#{user_id}/friends.json")
    end

    def friends_leaderboard(user_id: '-')
      return get("/user/#{user_id}/friends/leaderboard.json")
    end

    def friend_invitations(user_id: '-')
      return get("/user/#{user_id}/friends/invitations.json")
    end
  end
end
