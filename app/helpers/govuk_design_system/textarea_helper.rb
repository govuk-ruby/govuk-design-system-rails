module GovukDesignSystem
  module TextareaHelper
    def govukTextarea(kwargs = {})
      form = kwargs[:form]
      render((form.present? ? "form_components/govuk_textarea" : "components/govuk_textarea"), **kwargs)
    end
  end
end
