module GovukDesignSystem
  # Based on https://github.com/alphagov/govuk-frontend/blob/main/src/govuk/components/inset-text/template.njk
  module InsetTextHelper
    def govukInsetText(kwargs = {}, &block)
      kwargs[:block] = block
      render "components/govuk_inset_text", **kwargs
    end
  end
end
