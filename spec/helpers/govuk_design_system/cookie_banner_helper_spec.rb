require "rails_helper"

RSpec.describe GovukDesignSystem::CookieBannerHelper, type: :helper do
  describe "#govukCookieBanner" do
    it "returns the correct HTML for the default example" do
      html = helper.govukCookieBanner({
        ariaLabel: "Cookies on [name of service]",
        messages: [
          {
            headingText: "Cookies on [name of service]",
            html: <<~HTML.html_safe,
              <p class="govuk-body">We use some essential cookies to make this service work.</p>
              <p class="govuk-body">We’d also like to use analytics cookies so we can understand how you use the service and make improvements.</p>
            HTML
            actions: [
              {
                text: "Accept analytics cookies",
                type: "button",
                name: "cookies",
                value: "accept"
              },
              {
                text: "Reject analytics cookies",
                type: "button",
                name: "cookies",
                value: "reject"
              },
              {
                text: "View cookies",
                href: "#"
              }
            ]
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-cookie-banner" data-nosnippet="true" role="region" aria-label="Cookies on [name of service]">
          <div class="govuk-cookie-banner__message govuk-width-container">

            <div class="govuk-grid-row">
              <div class="govuk-grid-column-two-thirds">
                <h2 class="govuk-cookie-banner__heading govuk-heading-m">Cookies on [name of service]</h2>

                <div class="govuk-cookie-banner__content">
                  <p class="govuk-body">We use some essential cookies to make this service work.</p>
                  <p class="govuk-body">We’d also like to use analytics cookies so we can understand how you use the service and make improvements.</p>
                </div>
              </div>
            </div>
            <div class="govuk-button-group">
              <button value="accept" type="button" name="cookies" class="govuk-button" data-module="govuk-button">
                Accept analytics cookies
              </button>
              <button value="reject" type="button" name="cookies" class="govuk-button" data-module="govuk-button">
                Reject analytics cookies
              </button>
              <a class="govuk-link" href="#">View cookies</a>
            </div>
          </div>
        </div>
      HTML
    end
  end
end
