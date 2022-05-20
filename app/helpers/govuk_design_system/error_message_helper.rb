module GovukDesignSystem
  module ErrorMessageHelper
    def govukErrorMessage(kwargs = {})
      render "components/govuk_error_message", **kwargs
    end
  end
end
