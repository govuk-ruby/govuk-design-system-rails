require "rails_helper"

RSpec.describe GovukDesignSystem::NotificationBannerHelper, type: :helper do
  describe "#govukNotificationBanner" do
    context "when passing html to the component" do
      it "returns the correct HTML" do
        html = '<p class="govuk-notification-banner__heading">You have 7 days left to send your application.<a class="govuk-notification-banner__link" href="#">View application</a>.</p>'.html_safe
        output = helper.govukNotificationBanner({
          html: html,
        })

        expect(output).to match_html(<<~HTML)
            <div class="govuk-notification-banner" role="region" aria-labelledby="govuk-notification-banner-title" data-module="govuk-notification-banner">
            <div class="govuk-notification-banner__header">
              <h2 class="govuk-notification-banner__title" id="govuk-notification-banner-title">
                Important
              </h2>
            </div>
            <div class="govuk-notification-banner__content">
              <p class="govuk-notification-banner__heading">
                You have 7 days left to send your application.
                <a class="govuk-notification-banner__link" href="#">View application</a>.
              </p>
            </div>
          </div>
        HTML
      end
    end

    context "when passing text to the component" do
      it "returns the correct HTML" do
        output = helper.govukNotificationBanner({
          text: "There may be a delay in processing your application because of the coronavirus outbreak."
        })

        expect(output).to match_html(<<~HTML)
          <div class="govuk-notification-banner" role="region" aria-labelledby="govuk-notification-banner-title" data-module="govuk-notification-banner">
            <div class="govuk-notification-banner__header">
              <h2 class="govuk-notification-banner__title" id="govuk-notification-banner-title">
                Important
              </h2>
            </div>
            <div class="govuk-notification-banner__content">
              <p class="govuk-notification-banner__heading">There may be a delay in processing your application because of the coronavirus outbreak.</p>
            </div>
          </div>
        HTML
      end
    end

    context "when passing a block to the component" do
      it "returns the correct HTML" do
        output = helper.govukNotificationBanner { "Testing block passing" }

        expect(output).to match_html(<<~HTML)
          <div class="govuk-notification-banner" role="region" aria-labelledby="govuk-notification-banner-title" data-module="govuk-notification-banner">
            <div class="govuk-notification-banner__header">
              <h2 class="govuk-notification-banner__title" id="govuk-notification-banner-title">
                Important
              </h2>
            </div>
            <div class="govuk-notification-banner__content">
              Testing block passing
            </div>
          </div>
        HTML
      end
    end

    context "when rendering a success banner" do
      context "when passing html to the component" do
        it "returns the correct HTML for success" do
          html = "<h3 class='govuk-notification-banner__heading'>Training outcome recorded and trainee withdrawn</h3><p class='govuk-body'>Contact <a class='govuk-notification-banner__link' href='#'>example@department.gov.uk</a> if you think there's a problem.</p>".html_safe
          output = helper.govukNotificationBanner({
            html: html,
            type: "success"
          })

          expect(output).to match_html(<<~HTML)
            <div class="govuk-notification-banner govuk-notification-banner--success" role="alert" aria-labelledby="govuk-notification-banner-title" data-module="govuk-notification-banner">
              <div class="govuk-notification-banner__header">
                <h2 class="govuk-notification-banner__title" id="govuk-notification-banner-title">
                  Success
                </h2>
              </div>
              <div class="govuk-notification-banner__content">
                <h3 class="govuk-notification-banner__heading">
                  Training outcome recorded and trainee withdrawn
                </h3>
                <p class="govuk-body">Contact <a class="govuk-notification-banner__link" href="#">example@department.gov.uk</a> if you think there's a problem.</p>
              </div>
            </div>
          HTML
        end
      end
    end
  end
end
