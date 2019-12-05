module GovukDesignSystem
  module SummaryListHelper
    # Use the [summary list](https://design-system.service.gov.uk/components/summary-list/)
    # to summarise information, for example, a user’s responses at the end of a form.
    #
    # Implementation based on [nunjucks template](https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/summary-list/template.njk)
    def govukSummaryList(rows: [], classes: "", attributes: {})
      attributes[:class] = "govuk-summary-list #{classes}"

      # Determine if we need 2 or 3 columns
      anyRowHasActions = rows.detect { |row| row.fetch(:actions, {})[:items] }

      content_tag("dl", attributes) do
        rows.each do |row|
          row = content_tag("div", class: "govuk-summary-list__row") do
            concat content_tag("dt", (row[:key][:html] || row[:key][:text]), class: "govuk-summary-list__key")
            concat content_tag("dd", (row[:value][:html] || row[:value][:text]), class: "govuk-summary-list__value")

            if !row.fetch(:actions, {}).fetch(:items, []).empty?

              actions = content_tag("dd", class: "govuk-summary-list__actions") do
                row[:actions][:items].each do |item|
                  link = link_to(item[:href]) do
                    concat (item[:html] || item[:text])
                    if item[:visuallyHiddenText]
                      concat " "
                      concat content_tag("span", item[:visuallyHiddenText], class: "govuk-visually-hidden")
                    end
                  end
                  concat link
                end
              end

              concat actions

            elsif anyRowHasActions
              # Add dummy column to extend border #
              concat content_tag("span", "", class: "govuk-summary-list__actions")
            end
          end

          concat row
        end
      end
    end
  end
end
