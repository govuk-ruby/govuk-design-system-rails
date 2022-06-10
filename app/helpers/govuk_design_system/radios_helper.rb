module GovukDesignSystem
  module RadiosHelper
    def govukRadios(kwargs = {})
      render "components/govuk_radios", **kwargs
    end
  end
end
