module GovukDesignSystem
  module TextAreaHelper
    def govukTextarea(kwargs = {})
      render "components/govuk_text_area", **kwargs
    end
  end
end
