module Fitbit
  class Client
    # @param [String] user_id: User ID
    # @return [Object] response data from Fitbit API
    def devices(user_id: '-')
      return get("#{API_URI}/user/#{user_id}/devices.json")
    end

    # @param [String] user_id: User ID
    # @param [String] tracker_id: tracker
    # @return [Object] response data from Fitbit API
    def alarms(user_id: '-', tracker_id:)
      return get("#{API_URI}/user/#{user_id}/devices/tracker/#{tracker_id}/alarms.json")
    end

    # @param [String] user_id: User ID
    # @param [String] tracker_id: tracker id
    # @param [String] time: time
    # @param [Boolean] enabled: enabled
    # @param [Boolean] recurring: recurring
    # @param [String] week_days: week days
    # @return [Object] response data from Fitbit API
    def add_alarm(user_id: '-', tracker_id:, time:, enabled: true, recurring: true, week_days:)
      opts = {time: time, enabled: enabled, recurring: recurring, weekDays: week_days}
      return post("#{API_URI}/user/#{user_id}/devices/tracker/#{tracker_id}/alarms.json", opts)
    end

    # @param [String] user_id: User ID
    # @param [String] tracker_id: tracker id
    # @param [String] alarm_id: alarm id
    # @param [String] time: time
    # @param [Boolean] enabled: enabled
    # @param [Boolean] recurring: recurring
    # @param [String] week_days: week days
    # @param [String] snooze_length: snooze length
    # @param [String] snooze_count: snooze count
    # @param [String] label: label
    # @param [String] vibe: vibe
    # @return [Object] response data from Fitbit API
    def update_alarm(user_id: '-', tracker_id:, alarm_id:, time: nil, enabled: nil, recurring: nil, week_days: nil, snooze_length: nil, snooze_count: nil, label: nil, vibe: nil)
      registered_alarms = alarms(user_id: user_id, tracker_id: tracker_id)
      updating_alarm = nil

      registered_alarms['trackerAlarms'].each do |registered_alarm|
        if registered_alarm['alarmId'] == alarm_id.to_i
          updating_alarm = registered_alarm
        end
      end
      if updating_alarm.nil?
        return nil
      end

      opts = Hash.new
      opts['time'] = time.nil? ? updating_alarm['time'] : time
      opts['enabled'] = enabled.nil? ? updating_alarm['enabled'] : enabled
      opts['recurring'] = recurring.nil? ? updating_alarm['recurring'] : recurring
      opts['weekDays'] = week_days.nil? ? updating_alarm['weekDays'].join(',') : week_days
      opts['snoozeLength'] = snooze_length.nil? ? updating_alarm['snoozeLength'] : snooze_length
      opts['snoozeCount'] = snooze_count.nil? ? updating_alarm['snoozeCount'] : snooze_count
      opts['label'] = label unless label.nil?
      opts['vibe'] = vibe unless vibe.nil?

      return post("#{API_URI}/user/#{user_id}/devices/tracker/#{tracker_id}/alarms/#{alarm_id}.json", opts)
    end

    # @param [String] tracker_id: Tracker ID
    # @param [String] alarm_id: Alarm ID
    # @return [Object] response data from Fitbit API
    def delete_alarm(user_id: '-', tracker_id:, alarm_id:)
      return delete("#{API_URI}/user/#{user_id}/devices/tracker/#{tracker_id}/alarms/#{alarm_id}.json")
    end
  end
end
