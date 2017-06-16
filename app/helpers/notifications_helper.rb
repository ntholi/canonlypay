module NotificationsHelper
  def notifications_count
    current_user.notifications.size
  end
end
