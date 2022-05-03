module GovukDesignSystem
  module CookieBannerHelper
    def govukCookieBanner(kwargs = {})
      render "components/govuk_cookie_banner", **kwargs
    end
  end
end
