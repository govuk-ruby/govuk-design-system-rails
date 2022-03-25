module GovukDesignSystem
  module FileUploadHelper
    # Use the [file upload component](https://design-system.service.gov.uk/components/file-upload/)
    # to help users select and upload a file.
    #
    # Code based upon [nunjucks template](https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/file-upload/template.njk)
    def govukFileUpload(id:, name:, label:, value: nil, hint: nil, errorMessage: nil, formGroup: {}, classes: "", attributes: {}, described_by: nil)
      form_group_classes = "govuk-form-group"
      form_group_classes += " govuk-form-group--error" if errorMessage
      form_group_classes += " #{formGroup[:classes]}" if formGroup[:classes]

      # a record of other elements that we need to associate with the input using
      # aria-describedby – for example hints or error messages
      described_by ||= ""

      content_tag("div", class: form_group_classes) do
        concat govukLabel(html: label[:html], text: label[:text], classes: label[:classes], isPageHeading: label[:isPageHeading], attributes: (label[:attributes] || {}), for: id)

        if hint
          hint_id = "#{id}-hint"
          described_by += " #{hint_id}"

          concat govukHint(
            id: hint_id,
            classes: hint[:classes],
            attributes: hint[:attributes],
            html: hint[:html],
            text: hint[:text]
          )
        end

        if errorMessage
          error_id = "#{id}-error"
          described_by += " #{error_id}"

          concat govukErrorMessage(
            id: error_id,
            classes: errorMessage[:classes],
            attributes: errorMessage[:attributes],
            html: errorMessage[:html],
            text: errorMessage[:text],
            visuallyHiddenText: errorMessage[:visuallyHiddenText]
          )
        end

        attributes[:class] = "govuk-file-upload"
        attributes[:class] += " govuk-file-upload--error" if errorMessage
        attributes[:class] += " #{classes}" if classes
        attributes[:id] = id
        attributes[:name] = name
        attributes[:type] = "file"
        attributes[:value] = value if value
        attributes["aria-describedby"] = described_by if described_by

        concat content_tag("input", nil, attributes)
      end
    end
  end
end
