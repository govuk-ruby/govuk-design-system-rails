module GovukDesignSystem
  module DateInputHelper
    def govukDateInput(kwargs = {})
      form = kwargs[:form]
      render((form.present? ? "form_components/govuk_date_input" : "components/govuk_date_input"), **kwargs)
    end
  end
end
