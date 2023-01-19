module GovukDesignSystem
  module AccordionHelper
    def govukAccordion(kwargs = {})
      render "components/govuk_accordion", **kwargs
    end
  end
end
