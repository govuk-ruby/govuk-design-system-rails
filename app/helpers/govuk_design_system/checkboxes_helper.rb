module GovukDesignSystem
  module CheckboxesHelper
    def govukCheckboxes(kwargs = {})
      form = kwargs[:form]
      render((form.present? ? "form_components/govuk_checkboxes" : "components/govuk_checkboxes"), **kwargs)
    end
  end
end
