require "rails_helper"

RSpec.describe GovukDesignSystem::RadiosHelper, type: :helper do
  describe "#govukRadios" do
    it "returns the correct HTML when there is a hint" do
      html = helper.govukRadios({
        classes: "govuk-radios--inline",
        idPrefix: "changed-name",
        name: "changed-name",
        fieldset: {
          legend: {
            text: "Have you changed your name?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          }
        },
        hint: {
          text: "This includes changing your last name or spelling your name differently."
        },
        items: [
          {
            value: "yes",
            text: "Yes"
          },
          {
            value: "no",
            text: "No"
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <fieldset class="govuk-fieldset" aria-describedby="changed-name-hint">
            <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
              <h1 class="govuk-fieldset__heading">
                Have you changed your name?
              </h1>
            </legend>
            <div id="changed-name-hint" class="govuk-hint">
              This includes changing your last name or spelling your name differently.
            </div>
            <div class="govuk-radios govuk-radios--inline" data-module="govuk-radios">
              <div class="govuk-radios__item">
                <input class="govuk-radios__input" id="changed-name-1" name="changed-name" type="radio" value="yes">
                <label class="govuk-label govuk-radios__label" for="changed-name-1">
                  Yes
                </label>
              </div>
              <div class="govuk-radios__item">
                <input class="govuk-radios__input" id="changed-name-2" name="changed-name" type="radio" value="no">
                <label class="govuk-label govuk-radios__label" for="changed-name-2">
                  No
                </label>
              </div>
            </div>

            </fieldset>
          </div>
      HTML
    end

    it "returns the correct HTML when there is an error message" do
      html = helper.govukRadios({
        idPrefix: "where-do-you-live",
        name: "where-do-you-live",
        fieldset: {
          legend: {
            text: "Where do you live?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          }
        },
        items: [
          {
            value: "england",
            text: "England"
          },
          {
            value: "scotland",
            text: "Scotland"
          },
          {
            value: "wales",
            text: "Wales"
          },
          {
            value: "northern-ireland",
            text: "Northern Ireland"
          }
        ],
        errorMessage: {
          text: "Select the country where you live"
        }
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group govuk-form-group--error">
          <fieldset class="govuk-fieldset" aria-describedby="where-do-you-live-error">
            <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
              <h1 class="govuk-fieldset__heading">
                Where do you live?
              </h1>
            </legend>
            <p id="where-do-you-live-error" class="govuk-error-message">
              <span class="govuk-visually-hidden">Error:</span> Select the country where you live
            </p>
            <div class="govuk-radios" data-module="govuk-radios">
              <div class="govuk-radios__item">
                <input class="govuk-radios__input" id="where-do-you-live-1" name="where-do-you-live" type="radio" value="england">
                <label class="govuk-label govuk-radios__label" for="where-do-you-live-1">
                  England
                </label>
              </div>
              <div class="govuk-radios__item">
                <input class="govuk-radios__input" id="where-do-you-live-2" name="where-do-you-live" type="radio" value="scotland">
                <label class="govuk-label govuk-radios__label" for="where-do-you-live-2">
                  Scotland
                </label>
              </div>
              <div class="govuk-radios__item">
                <input class="govuk-radios__input" id="where-do-you-live-3" name="where-do-you-live" type="radio" value="wales">
                <label class="govuk-label govuk-radios__label" for="where-do-you-live-3">
                  Wales
                </label>
              </div>
              <div class="govuk-radios__item">
                <input class="govuk-radios__input" id="where-do-you-live-4" name="where-do-you-live" type="radio" value="northern-ireland">
                <label class="govuk-label govuk-radios__label" for="where-do-you-live-4">
                  Northern Ireland
                </label>
              </div>
            </div>
          </fieldset>
        </div>
      HTML
    end

    it "returns the correct HTML when there is a conditional" do
      email_htmltml = helper.govukInput({
        id: "contact-by-email",
        name: "contact-by-email",
        type: "email",
        autocomplete: "email",
        spellcheck: false,
        classes: "govuk-!-width-one-third",
        label: {
          text: "Email address"
        }
      })

      phone_html = helper.govukInput({
        id: "contact-by-phone",
        name: "contact-by-phone",
        type: "tel",
        autocomplete: "tel",
        classes: "govuk-!-width-one-third",
        label: {
          text: "Phone number"
        }
      })

      text_html = helper.govukInput({
        id: "contact-by-text",
        name: "contact-by-text",
        type: "tel",
        autocomplete: "tel",
        classes: "govuk-!-width-one-third",
        label: {
          text: "Mobile phone number"
        }
      })

      helper.govukRadios({
        idPrefix: "contact",
        name: "contact",
        fieldset: {
          legend: {
            text: "How would you prefer to be contacted?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          }
        },
        hint: {
          text: "Select one option."
        },
        items: [
          {
            value: "email",
            text: "Email",
            conditional: {
              html: email_htmltml
            }
          },
          {
            value: "phone",
            text: "Phone",
            conditional: {
              html: phone_html
            }
          },
          {
            value: "text",
            text: "Text message",
            conditional: {
              html: text_html
            }
          }
        ]
      })
    end

    it "returns the correct HTML when there is a fieldset css class" do
      html = helper.govukRadios({
        classes: "govuk-radios--inline",
        idPrefix: "changed-name",
        name: "changed-name",
        fieldset: {
          classes: "opss-grouping",
          legend: {
            text: "Have you changed your name?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          }
        },
        hint: {
          text: "This includes changing your last name or spelling your name differently."
        },
        items: [
          {
            value: "yes",
            text: "Yes"
          },
          {
            value: "no",
            text: "No"
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <fieldset class="govuk-fieldset opss-grouping" aria-describedby="changed-name-hint">
            <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
              <h1 class="govuk-fieldset__heading">
                Have you changed your name?
              </h1>
            </legend>
            <div id="changed-name-hint" class="govuk-hint">
              This includes changing your last name or spelling your name differently.
            </div>
            <div class="govuk-radios govuk-radios--inline" data-module="govuk-radios">
              <div class="govuk-radios__item">
                <input class="govuk-radios__input" id="changed-name-1" name="changed-name" type="radio" value="yes">
                <label class="govuk-label govuk-radios__label" for="changed-name-1">
                  Yes
                </label>
              </div>
              <div class="govuk-radios__item">
                <input class="govuk-radios__input" id="changed-name-2" name="changed-name" type="radio" value="no">
                <label class="govuk-label govuk-radios__label" for="changed-name-2">
                  No
                </label>
              </div>
            </div>

            </fieldset>
          </div>
      HTML
    end
  end
end
