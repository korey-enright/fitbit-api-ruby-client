module Fitbit
  class Client
    def friends(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/friends.json")
    end

    def friends_leaderboard(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/friends/leaderboard.json")
    end

    def invite_friend(invited_user_email: nil, invited_user_id: nil)
      opts = Hash.new
      unless invited_user_email.nil?
        opts['invitedUserEmail'] = invited_user_email
      end
      unless invited_user_id.nil?
        opts['invitedUserId'] = invited_user_id
      end

      return post("#{API_URI}/user/-/friends/invitations.json", opts)
    end

    def friend_invitations(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/friends/invitations.json")
    end

    def respond_to_friend_invitation(from_user_id:, accept: true)
      return post("#{API_URI}/user/-/friends/invitations/#{from_user_id}.json", {accept: accept})
    end
  end
end
