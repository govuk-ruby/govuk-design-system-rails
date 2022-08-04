module GovukDesignSystem
  module SelectHelper
    def govukSelect(kwargs = {})
      form = kwargs[:form]
      render((form.present? ? "form_components/govuk_select" : "components/govuk_select"), **kwargs)
    end
  end
end
