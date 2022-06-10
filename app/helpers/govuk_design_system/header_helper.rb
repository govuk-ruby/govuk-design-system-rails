module GovukDesignSystem
  module HeaderHelper
    def govukHeader(kwargs = {})
      render "components/govuk_header", **kwargs
    end
  end
end
