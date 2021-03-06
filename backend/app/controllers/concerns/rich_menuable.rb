module RichMenuable
  extend ActiveSupport::Concern

  # Lineリッチメニューのポストバックアクションに対応したメソッドを呼び出す
  # リッチメニューには以下の6つのアクションを設定している
  #   - reply_weather_forecast
  #   - notice_time_setting
  #   - toggle_silent_notice
  #   - location_resetting
  #   - issue_serial_number
  #   - profile_page
  def rich_menus(event, line_user)
    send(event['postback']['data'], event, line_user)
  end

  def reply_weather_forecast(_event, line_user)
    reply('notice_weather', line_user: line_user, weather: line_user.weather, reply_forecast: true)
  end

  def notice_time_setting(event, line_user)
    target_time = event['postback']['params']['time']

    line_user.update_attribute(:notice_time, target_time)
    reply('completed_notice_time_setting', line_user: line_user)
  end

  def toggle_silent_notice(_event, line_user)
    boolean = line_user.silent_notice

    line_user.update_attribute(:silent_notice, !boolean)
    reply('completed_toggle_silent_notice', line_user: line_user)
  end

  def location_resetting(_event, line_user)
    line_user.update_attribute(:locating_from, Time.zone.now)
    reply('location_resetting', 'send_location_information')
  end

  def issue_serial_number(_event, line_user)
    if line_user.user
      reply('completed_issue_serial_number', line_user: line_user)
    else
      file_names = %w[completed_issue_serial_number issue_serial_number explain_serial_number]
      reply(*file_names, line_user: line_user)
    end
  end

  def profile_page(_event, line_user)
    reply('profile_page', line_user: line_user)
  end
end
