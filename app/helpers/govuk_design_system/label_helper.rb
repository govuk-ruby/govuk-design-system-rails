module GovukDesignSystem
  module LabelHelper
    def govukLabel(kwargs = {})
      render "components/govuk_label", **kwargs
    end
  end
end
