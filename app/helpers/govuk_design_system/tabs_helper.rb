module GovukDesignSystem
  module TabsHelper
    def govukTabs(kwargs = {})
      render "components/govuk_tabs", **kwargs
    end
  end
end
