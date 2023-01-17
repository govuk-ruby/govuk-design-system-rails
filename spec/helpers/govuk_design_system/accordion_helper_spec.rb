require "rails_helper"

RSpec.describe GovukDesignSystem::AccordionHelper, type: :helper do
  describe "#govukAccordion" do
    it "returns the correct HTML for the default example" do
      html = helper.govukAccordion({
        id: "accordion-default",
        items: [
          {
            heading: {
              text: "Writing well for the web"
            },
            content: {
              html: "<p class='govuk-body'>This is the content for Writing well for the web.</p>".html_safe
            }
          },
          {
            heading: {
              text: "Writing well for specialists"
            },
            content: {
              html: "<p class='govuk-body'>This is the content for Writing well for specialists.</p>".html_safe
            }
          },
          {
            heading: {
              text: "Know your audience"
            },
            content: {
              html: "<p class='govuk-body'>This is the content for Know your audience.</p>".html_safe
            }
          },
          {
            heading: {
              text: "How people read"
            },
            content: {
              html: "<p class='govuk-body'>This is the content for How people read.</p>".html_safe
            }
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-accordion" data-module="govuk-accordion" id="accordion-default">
          <div class="govuk-accordion__section">
            <div class="govuk-accordion__section-header">
              <h2 class="govuk-accordion__section-heading">
                <span class="govuk-accordion__section-button" id="accordion-default-heading-1">
                  Writing well for the web
                </span>
              </h2>
            </div>
            <div id="accordion-default-content-1" class="govuk-accordion__section-content" aria-labelledby="accordion-default-heading-1">
              <p class='govuk-body'>This is the content for Writing well for the web.</p>
            </div>
          </div>
          <div class="govuk-accordion__section">
            <div class="govuk-accordion__section-header">
              <h2 class="govuk-accordion__section-heading">
                <span class="govuk-accordion__section-button" id="accordion-default-heading-2">
                  Writing well for specialists
                </span>
              </h2>
            </div>
            <div id="accordion-default-content-2" class="govuk-accordion__section-content" aria-labelledby="accordion-default-heading-2">
              <p class='govuk-body'>This is the content for Writing well for specialists.</p>
            </div>
          </div>
          <div class="govuk-accordion__section">
            <div class="govuk-accordion__section-header">
              <h2 class="govuk-accordion__section-heading">
                <span class="govuk-accordion__section-button" id="accordion-default-heading-3">
                  Know your audience
                </span>
              </h2>
            </div>
            <div id="accordion-default-content-3" class="govuk-accordion__section-content" aria-labelledby="accordion-default-heading-3">
              <p class='govuk-body'>This is the content for Know your audience.</p>
            </div>
          </div>
          <div class="govuk-accordion__section">
            <div class="govuk-accordion__section-header">
              <h2 class="govuk-accordion__section-heading">
                <span class="govuk-accordion__section-button" id="accordion-default-heading-4">
                  How people read
                </span>
              </h2>
            </div>
            <div id="accordion-default-content-4" class="govuk-accordion__section-content" aria-labelledby="accordion-default-heading-4">
              <p class='govuk-body'>This is the content for How people read.</p>
            </div>
          </div>
        </div>
      HTML
    end

    it "returns the correct HTML for the summary line example" do
      html = helper.govukAccordion({
        id: "accordion-with-summary-sections",
        items: [
          {
            heading: {
              text: "Understanding agile project management"
            },
            summary: {
              text: "Introductions, methods, core features."
            },
            content: {
              html:
                '<ul class="govuk-list">
                  <li>
                    <a class="govuk-link" href="#">Agile and government services: an introduction</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Agile methods: an introduction</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Core principles of agile</a>
                  </li>
              </ul>'.html_safe
            }
          },
          {
            heading: {
              text: "Working with agile methods"
            },
            summary: {
              text: "Workspaces, tools and techniques, user stories, planning."
            },
            content: {
              html:
                '<ul class="govuk-list">
                  <li>
                    <a class="govuk-link" href="#">Creating an agile working environment</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Agile tools and techniques</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Set up a team wall</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Writing user stories</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Planning in agile</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Deciding on priorities</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Developing a roadmap</a>
                  </li>
              </ul>'.html_safe
            }
          },
          {
            heading: {
              text: "Governing agile services"
            },
            summary: {
              text: "Principles, measuring progress, spending money."
            },
            content: {
              html:
                '<ul class="govuk-list">
                  <li>
                    <a class="govuk-link" href="#">Governance principles for agile service delivery</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Measuring and reporting progress</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Spend controls: check if you need approval to spend money on a service</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Spend controls: apply for approval to spend money on a service</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Spend controls: the new pipeline process</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Working across organisational boundaries</a>
                  </li>
              </ul>'.html_safe
            }
          },
          {
            heading: {
              text: "Phases of an agile project"
            },
            summary: {
              text: "Discovery, alpha, beta, live and retirement."
            },
            content: {
              html:
                '<ul class="govuk-list">
                  <li>
                    <a class="govuk-link" href="#">How the discovery phase works</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">How the alpha phase works</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">How the beta phase works</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">How the live phase works</a>
                  </li>
                  <li>
                    <a class="govuk-link" href="#">Retiring your service</a>
                  </li>
              </ul>'.html_safe
            }
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-accordion" data-module="govuk-accordion" id="accordion-with-summary-sections">
          <div class="govuk-accordion__section">
            <div class="govuk-accordion__section-header">
              <h2 class="govuk-accordion__section-heading">
                <span class="govuk-accordion__section-button" id="accordion-with-summary-sections-heading-1">
                  Understanding agile project management
                </span>
              </h2>
              <div class="govuk-accordion__section-summary govuk-body" id="accordion-with-summary-sections-summary-1">
                Introductions, methods, core features.
              </div>
            </div>
            <div id="accordion-with-summary-sections-content-1" class="govuk-accordion__section-content" aria-labelledby="accordion-with-summary-sections-heading-1">
              <ul class="govuk-list">
                <li>
                  <a class="govuk-link" href="#">Agile and government services: an introduction</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Agile methods: an introduction</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Core principles of agile</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="govuk-accordion__section">
            <div class="govuk-accordion__section-header">
              <h2 class="govuk-accordion__section-heading">
                <span class="govuk-accordion__section-button" id="accordion-with-summary-sections-heading-2">
                  Working with agile methods
                </span>
              </h2>
              <div class="govuk-accordion__section-summary govuk-body" id="accordion-with-summary-sections-summary-2">
                Workspaces, tools and techniques, user stories, planning.
              </div>
            </div>
            <div id="accordion-with-summary-sections-content-2" class="govuk-accordion__section-content" aria-labelledby="accordion-with-summary-sections-heading-2">
              <ul class="govuk-list">
                <li>
                  <a class="govuk-link" href="#">Creating an agile working environment</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Agile tools and techniques</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Set up a team wall</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Writing user stories</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Planning in agile</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Deciding on priorities</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Developing a roadmap</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="govuk-accordion__section">
            <div class="govuk-accordion__section-header">
              <h2 class="govuk-accordion__section-heading">
                <span class="govuk-accordion__section-button" id="accordion-with-summary-sections-heading-3">
                  Governing agile services
                </span>
              </h2>
              <div class="govuk-accordion__section-summary govuk-body" id="accordion-with-summary-sections-summary-3">
                Principles, measuring progress, spending money.
              </div>
            </div>
            <div id="accordion-with-summary-sections-content-3" class="govuk-accordion__section-content" aria-labelledby="accordion-with-summary-sections-heading-3">
              <ul class="govuk-list">
                <li>
                  <a class="govuk-link" href="#">Governance principles for agile service delivery</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Measuring and reporting progress</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Spend controls: check if you need approval to spend money on a service</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Spend controls: apply for approval to spend money on a service</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Spend controls: the new pipeline process</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Working across organisational boundaries</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="govuk-accordion__section">
            <div class="govuk-accordion__section-header">
              <h2 class="govuk-accordion__section-heading">
                <span class="govuk-accordion__section-button" id="accordion-with-summary-sections-heading-4">
                  Phases of an agile project
                </span>
              </h2>
              <div class="govuk-accordion__section-summary govuk-body" id="accordion-with-summary-sections-summary-4">
                Discovery, alpha, beta, live and retirement.
              </div>
            </div>
            <div id="accordion-with-summary-sections-content-4" class="govuk-accordion__section-content" aria-labelledby="accordion-with-summary-sections-heading-4">
              <ul class="govuk-list">
                <li>
                  <a class="govuk-link" href="#">How the discovery phase works</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">How the alpha phase works</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">How the beta phase works</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">How the live phase works</a>
                </li>
                <li>
                  <a class="govuk-link" href="#">Retiring your service</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      HTML
    end
  end
end
