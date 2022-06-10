module GovukDesignSystem
  module DateInputHelper
    def govukDateInput(kwargs = {})
      render "components/govuk_date_input", **kwargs
    end
  end
end
