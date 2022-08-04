require "rails_helper"

RSpec.describe GovukDesignSystem::BreadcrumbsHelper, type: :helper do
  describe "#govukBreadcrumbs" do
    it "returns the correct HTML for the default example" do
      html = helper.govukBreadcrumbs({
        items: [
          {
            text: "Home",
            href: "#"
          },
          {
            text: "Passports, travel and living abroad",
            href: "#"
          },
          {
            text: "Travel abroad",
            href: "#"
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-breadcrumbs">
          <ol class="govuk-breadcrumbs__list">
            <li class="govuk-breadcrumbs__list-item">
              <a class="govuk-breadcrumbs__link" href="#">Home</a>
            </li>
            <li class="govuk-breadcrumbs__list-item">
              <a class="govuk-breadcrumbs__link" href="#">Passports, travel and living abroad</a>
            </li>
            <li class="govuk-breadcrumbs__list-item">
              <a class="govuk-breadcrumbs__link" href="#">Travel abroad</a>
            </li>
          </ol>
        </div>
      HTML
    end

    it "allows a collapsing on mobile" do
      html = helper.govukBreadcrumbs({
        collapseOnMobile: true,
        items: [
          {
            text: "Home",
            href: "#"
          },
          {
            text: "Environment",
            href: "#"
          },
          {
            text: "Rural and countryside",
            href: "#"
          },
          {
            text: "Rural development and land management",
            href: "#"
          },
          {
            text: "Economic growth in rural areas",
            href: "#"
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-breadcrumbs govuk-breadcrumbs--collapse-on-mobile">
          <ol class="govuk-breadcrumbs__list">
            <li class="govuk-breadcrumbs__list-item">
              <a class="govuk-breadcrumbs__link" href="#">Home</a>
            </li>
            <li class="govuk-breadcrumbs__list-item">
              <a class="govuk-breadcrumbs__link" href="#">Environment</a>
            </li>
            <li class="govuk-breadcrumbs__list-item">
              <a class="govuk-breadcrumbs__link" href="#">Rural and countryside</a>
            </li>
            <li class="govuk-breadcrumbs__list-item">
              <a class="govuk-breadcrumbs__link" href="#">Rural development and land management</a>
            </li>
            <li class="govuk-breadcrumbs__list-item">
              <a class="govuk-breadcrumbs__link" href="#">Economic growth in rural areas</a>
            </li>
          </ol>
        </div>
      HTML
    end
  end
end
