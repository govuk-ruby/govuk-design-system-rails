module GovukDesignSystem
  module CheckboxesHelper
    def govukCheckboxes(kwargs = {})
      render "components/govuk_checkboxes", **kwargs
    end
  end
end
