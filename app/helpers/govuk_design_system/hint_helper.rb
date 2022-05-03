module GovukDesignSystem
  module HintHelper
    def govukHint(kwargs = {})
      render "components/govuk_hint", **kwargs
    end
  end
end
