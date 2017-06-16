module NotificationsHelper
  def notifications_badge
    count = current_user.notifications.where(read: false).size
    if count > 0
      "<span class=\"notifications-badge badge\"> #{count} </span>".html_safe
    end
  end
end
