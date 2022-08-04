require "rails_helper"

RSpec.describe GovukDesignSystem::TabsHelper, type: :helper do
  describe "#govukTabs" do
    it "returns the correct HTML for the default example" do
      html = helper.govukTabs({
        items: [
          {
            label: "Past day",
            id: "past-day",
            panel: {
              html: "<strong>Past day</strong>".html_safe
            }
          },
          {
            label: "Past week",
            id: "past-week",
            panel: {
              html: "<strong>Past week</strong>".html_safe
            }
          },
          {
            label: "Past month",
            id: "past-month",
            panel: {
              html: "<strong>Past month</strong>".html_safe
            }
          },
          {
            label: "Past year",
            id: "past-year",
            panel: {
              html: "<strong>Past year</strong>".html_safe
            }
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-tabs" data-module="govuk-tabs">
          <h2 class="govuk-tabs__title">
            Contents
          </h2>
          <ul class="govuk-tabs__list">
            <li class="govuk-tabs__list-item govuk-tabs__list-item--selected">
              <a class="govuk-tabs__tab" href="#past-day">
                Past day
              </a>
            </li>
            <li class="govuk-tabs__list-item">
              <a class="govuk-tabs__tab" href="#past-week">
                Past week
              </a>
            </li>
            <li class="govuk-tabs__list-item">
              <a class="govuk-tabs__tab" href="#past-month">
                Past month
              </a>
            </li>
            <li class="govuk-tabs__list-item">
              <a class="govuk-tabs__tab" href="#past-year">
                Past year
              </a>
            </li>
          </ul>
          <div class="govuk-tabs__panel" id="past-day">
            <strong>Past day</strong>
          </div>
          <div class="govuk-tabs__panel govuk-tabs__panel--hidden" id="past-week">
            <strong>Past week</strong>
          </div>
          <div class="govuk-tabs__panel govuk-tabs__panel--hidden" id="past-month">
            <strong>Past month</strong>
          </div>
          <div class="govuk-tabs__panel govuk-tabs__panel--hidden" id="past-year">
            <strong>Past year</strong>
          </div>
        </div>
      HTML
    end
  end
end
