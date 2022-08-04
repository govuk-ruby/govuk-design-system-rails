module GovukDesignSystem
  module SummaryListHelper
    def govukSummaryList(kwargs = {})
      render "components/govuk_summary_list", **kwargs
    end
  end
end
