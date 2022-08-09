module GovukDesignSystem
  module NotificationBannerHelper
    def govukNotificationBanner(kwargs = {}, &block)
      kwargs[:block] = block
      render "components/govuk_notification_banner", **kwargs
    end
  end
end
