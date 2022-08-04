module GovukDesignSystem
  module HmctsBannerHelper
    def hmctsBanner(kwargs = {})
      render "components/hmcts_banner", **kwargs
    end
  end
end
