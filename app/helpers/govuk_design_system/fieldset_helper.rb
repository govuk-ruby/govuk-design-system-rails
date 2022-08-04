module GovukDesignSystem
  # Based on https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/fieldset/template.njk
  module FieldsetHelper
    def govukFieldset(kwargs = {}, &block)
      kwargs[:block] = block
      render "components/govuk_fieldset", **kwargs
    end
  end
end
