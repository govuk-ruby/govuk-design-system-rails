module GovukDesignSystem
  module RadiosHelper
    def govukRadios(kwargs = {}, &blk)
      form = kwargs[:form]
      kwargs[:extra_html] = capture(&blk) if block_given?
      render((form.present? ? "form_components/govuk_radios" : "components/govuk_radios"), **kwargs)
    end
  end
end
