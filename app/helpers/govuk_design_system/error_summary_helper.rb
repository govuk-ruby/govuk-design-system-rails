module GovukDesignSystem
  module ErrorSummaryHelper
    def govukErrorSummary(kwargs = {})
      render "components/govuk_error_summary", **kwargs
    end
  end
end
