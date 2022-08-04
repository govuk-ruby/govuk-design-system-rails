module GovukDesignSystem
  module ErrorSummaryHelper
    def govukErrorSummary(kwargs = {})
      form = kwargs[:form]

      if form.present?
        errors = kwargs[:errors] || form.object.errors
        return unless errors.try(:any?)

        kwargs[:titleText] = "There is a problem"
        kwargs[:errorList] = errors.details.keys.flat_map do |attribute|
          prefix = get_attribute_id_prefix(form, attribute)
          errors.full_messages_for(attribute).map { |m| { text: m, href: "##{prefix}-error" } }
        end
      end

      render "components/govuk_error_summary", **kwargs
    end
  end
end
