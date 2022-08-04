module GovukDesignSystem
  module BreadcrumbsHelper
    def govukBreadcrumbs(kwargs = {})
      render "components/govuk_breadcrumbs", **kwargs
    end
  end
end
