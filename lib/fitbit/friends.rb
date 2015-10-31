module Fitbit
  class Client
    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def friends(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/friends.json")
    end

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def friends_leaderboard(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/friends/leaderboard.json")
    end

    # @overload invite_friend(invite_user_email:)
    #   @param [String] invite_user_email: Invite User Email
    # @overload invite_friend(invite_user_id:)
    #   @param [String] invite_user_id: Invite User ID
    # @return [Hash] response data from Fitbit API
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

    # @param [String] user_id: User ID
    # @return [Hash] response data from Fitbit API
    def friend_invitations(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/friends/invitations.json")
    end

    # @param [String] from_user_id: From User ID
    # @param [Boolean] accept: accept
    # @return [Hash] response data from Fitbit API
    def respond_to_friend_invitation(from_user_id:, accept: true)
      return post("#{API_URI}/user/-/friends/invitations/#{from_user_id}.json", {accept: accept})
    end
  end
end
