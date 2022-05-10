require "rails_helper"

RSpec.describe GovukDesignSystem::SummaryListHelper, type: :helper do
  describe "#govukSummaryList" do
    it "returns the correct HTML for the default example" do
      html = helper.govukSummaryList({
        rows: [
          {
            key: {
              text: "Name"
            },
            value: {
              text: "Sarah Philips"
            },
            actions: {
              items: [
                {
                  href: "#",
                  text: "Change",
                  visuallyHiddenText: "name"
                }
              ]
            }
          },
          {
            key: {
              text: "Date of birth"
            },
            value: {
              text: "5 January 1978"
            },
            actions: {
              items: [
                {
                  href: "#",
                  text: "Change",
                  visuallyHiddenText: "date of birth"
                }
              ]
            }
          },
          {
            key: {
              text: "Address"
            },
            value: {
              html: "72 Guild Street<br>London<br>SE23 6FH".html_safe
            },
            actions: {
              items: [
                {
                  href: "#",
                  text: "Change",
                  visuallyHiddenText: "address"
                }
              ]
            }
          },
          {
            key: {
              text: "Contact details"
            },
            value: {
              html: '<p class="govuk-body">07700 900457</p><p class="govuk-body">sarah.phillips@example.com</p>'.html_safe
            },
            actions: {
              items: [
                {
                  href: "#",
                  text: "Change",
                  visuallyHiddenText: "contact details"
                }
              ]
            }
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <dl class="govuk-summary-list">
          <div class="govuk-summary-list__row">
            <dt class="govuk-summary-list__key">
              Name
            </dt>
            <dd class="govuk-summary-list__value">
              Sarah Philips
            </dd>
            <dd class="govuk-summary-list__actions">
              <a class="govuk-link" href="#">
                Change<span class="govuk-visually-hidden"> name</span>
              </a>
            </dd>
          </div>
          <div class="govuk-summary-list__row">
            <dt class="govuk-summary-list__key">
              Date of birth
            </dt>
            <dd class="govuk-summary-list__value">
              5 January 1978
            </dd>
            <dd class="govuk-summary-list__actions">
              <a class="govuk-link" href="#">
                Change<span class="govuk-visually-hidden"> date of birth</span>
              </a>
            </dd>
          </div>
          <div class="govuk-summary-list__row">
            <dt class="govuk-summary-list__key">
              Address
            </dt>
            <dd class="govuk-summary-list__value">
              72 Guild Street<br>London<br>SE23 6FH
            </dd>
            <dd class="govuk-summary-list__actions">
              <a class="govuk-link" href="#">
                Change<span class="govuk-visually-hidden"> address</span>
              </a>
            </dd>
          </div>
          <div class="govuk-summary-list__row">
            <dt class="govuk-summary-list__key">
              Contact details
            </dt>
            <dd class="govuk-summary-list__value">
              <p class="govuk-body">07700 900457</p>
              <p class="govuk-body">sarah.phillips@example.com</p>
            </dd>
            <dd class="govuk-summary-list__actions">
              <a class="govuk-link" href="#">
                Change<span class="govuk-visually-hidden"> contact details</span>
              </a>
            </dd>
          </div>
        </dl>
      HTML
    end
  end
end
