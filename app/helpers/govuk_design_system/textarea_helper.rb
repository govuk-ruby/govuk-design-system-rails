module GovukDesignSystem
  module TextareaHelper
    def govukTextarea(kwargs = {})
      render "components/govuk_textarea", **kwargs
    end
  end
end
