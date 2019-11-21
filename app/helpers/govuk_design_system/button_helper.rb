module GovukDesignSystem
  module ButtonHelper
    # Based on https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/button/template.njk
    def govukButton(element: nil, text: nil, html: nil, name: nil, type: nil, value: nil, disabled: nil, href: nil, classes: "", attributes: {}, preventDoubleClick: nil, isStartButton: nil)

      # Determine type of element to use, if not explicitly set
      element ||= ( href ? 'a' : 'button')

      attributes[:class] = "govuk-button #{classes}"

      if isStartButton
        iconHtml = '<svg class="govuk-button__start-icon" xmlns="http://www.w3.org/2000/svg" width="17.5" height="19" viewBox="0 0 33 40" role="presentation" focusable="false"><path fill="currentColor" d="M0 0h13l20 20-20 20H0l20-20z"/></svg>'.html_safe
        attributes[:class] = attributes[:class] + ' govuk-button--start'
      end

      # Define common attributes we can use for both button and input types

      if name
        attributes[:name] = name
      end

      if disabled
        attributes[:disabled] = disabled
      end

      if preventDoubleClick
        attributes['data-prevent-double-click'] = 'true'
      end

      if element == 'a'

        attributes.merge!({role: 'button', draggable: 'false'})

        link_to href, attributes do
          concat (html || text)
          concat iconHtml.to_s
        end

      elsif element == 'button'

        attributes[:value] = value if value
        attribtues[:type] = type if type

        content_tag 'button', attributes do
          concat (html || text)
          concat iconHtml.to_s
        end

      elsif element == 'input'

        attributes[:value] = text
        attribtues[:type] = type || 'submit'

        content_tag 'input', attributes

      end
    end
  end
end
