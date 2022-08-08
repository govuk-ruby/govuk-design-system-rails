module GovukDesignSystem
  module NotificationBannerHelper
    def govukNotificationBanner(kwargs = {})
      render "components/govuk_notification_banner", **kwargs
    end
  end
end
