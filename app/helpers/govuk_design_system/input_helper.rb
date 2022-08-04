module GovukDesignSystem
  module InputHelper
    def govukInput(kwargs = {})
      form = kwargs[:form]
      render((form.present? ? "form_components/govuk_input" : "components/govuk_input"), **kwargs)
    end
  end
end
