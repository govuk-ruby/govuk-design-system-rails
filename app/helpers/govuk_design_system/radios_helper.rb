module GovukDesignSystem
  module RadiosHelper
    def govukRadios(kwargs = {})
      form = kwargs[:form]
      render((form.present? ? "form_components/govuk_radios" : "components/govuk_radios"), **kwargs)
    end
  end
end
