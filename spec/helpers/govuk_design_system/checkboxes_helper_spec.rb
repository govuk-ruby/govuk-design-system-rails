require "rails_helper"

RSpec.describe GovukDesignSystem::CheckboxesHelper, type: :helper do
  describe "#govukCheckboxes" do
    it "returns the correct HTML for the default example" do
      html = helper.govukCheckboxes({
        idPrefix: "waste",
        name: "waste",
        fieldset: {
          legend: {
            text: "Which types of waste do you transport?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          }
        },
        hint: {
          text: "Select all that apply."
        },
        items: [
          {
            value: "carcasses",
            text: "Waste from animal carcasses",
            disable_ghost: true
          },
          {
            value: "mines",
            text: "Waste from mines or quarries",
            disable_ghost: true
          },
          {
            value: "farm",
            text: "Farm or agricultural waste",
            disable_ghost: true
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <fieldset class="govuk-fieldset" aria-describedby="waste-hint">
            <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
              <h1 class="govuk-fieldset__heading">
                Which types of waste do you transport?
              </h1>
            </legend>
            <div id="waste-hint" class="govuk-hint">
              Select all that apply.
            </div>
            <div class="govuk-checkboxes" data-module="govuk-checkboxes">
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste" name="waste" type="checkbox" value="carcasses">
                <label class="govuk-label govuk-checkboxes__label" for="waste">
                  Waste from animal carcasses
                </label>
              </div>
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste-2" name="waste" type="checkbox" value="mines">
                <label class="govuk-label govuk-checkboxes__label" for="waste-2">
                  Waste from mines or quarries
                </label>
              </div>
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste-3" name="waste" type="checkbox" value="farm">
                <label class="govuk-label govuk-checkboxes__label" for="waste-3">
                  Farm or agricultural waste
                </label>
              </div>
            </div>

          </fieldset>
        </div>
      HTML
    end

    it "adds ghost inputs by default as required by Rails" do
      # NOTE: https://github.com/govuk-ruby/govuk-design-system-rails/blob/master/README.md#component-implementations
      html = helper.govukCheckboxes({
        idPrefix: "waste",
        name: "waste",
        fieldset: {
          legend: {
            text: "Which types of waste do you transport?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          }
        },
        hint: {
          text: "Select all that apply."
        },
        items: [
          {
            value: "carcasses",
            text: "Waste from animal carcasses",
          },
          {
            value: "mines",
            text: "Waste from mines or quarries",
          },
          {
            value: "farm",
            text: "Farm or agricultural waste",
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <fieldset class="govuk-fieldset" aria-describedby="waste-hint">
            <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
              <h1 class="govuk-fieldset__heading">
                Which types of waste do you transport?
              </h1>
            </legend>
            <div id="waste-hint" class="govuk-hint">
              Select all that apply.
            </div>
            <div class="govuk-checkboxes" data-module="govuk-checkboxes">
              <input type="hidden" value="0" name="waste">
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste" name="waste" type="checkbox" value="carcasses">
                <label class="govuk-label govuk-checkboxes__label" for="waste">
                  Waste from animal carcasses
                </label>
              </div>
              <input type="hidden" value="0" name="waste">
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste-2" name="waste" type="checkbox" value="mines">
                <label class="govuk-label govuk-checkboxes__label" for="waste-2">
                  Waste from mines or quarries
                </label>
              </div>
              <input type="hidden" value="0" name="waste">
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste-3" name="waste" type="checkbox" value="farm">
                <label class="govuk-label govuk-checkboxes__label" for="waste-3">
                  Farm or agricultural waste
                </label>
              </div>
            </div>

          </fieldset>
        </div>
      HTML
    end

    it "returns the correct HTML when there is a fieldset css class" do
      html = helper.govukCheckboxes({
        idPrefix: "waste",
        name: "waste",
        fieldset: {
          legend: {
            text: "Which types of waste do you transport?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          },
          classes: "js-mutually-exclusive"
        },
        hint: {
          text: "Select all that apply."
        },
        items: [
          {
            value: "carcasses",
            text: "Waste from animal carcasses",
            disable_ghost: true
          },
          {
            value: "mines",
            text: "Waste from mines or quarries",
            disable_ghost: true
          },
          {
            value: "farm",
            text: "Farm or agricultural waste",
            disable_ghost: true
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <fieldset class="govuk-fieldset js-mutually-exclusive" aria-describedby="waste-hint">
            <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
              <h1 class="govuk-fieldset__heading">
                Which types of waste do you transport?
              </h1>
            </legend>
            <div id="waste-hint" class="govuk-hint">
              Select all that apply.
            </div>
            <div class="govuk-checkboxes" data-module="govuk-checkboxes">
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste" name="waste" type="checkbox" value="carcasses">
                <label class="govuk-label govuk-checkboxes__label" for="waste">
                  Waste from animal carcasses
                </label>
              </div>
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste-2" name="waste" type="checkbox" value="mines">
                <label class="govuk-label govuk-checkboxes__label" for="waste-2">
                  Waste from mines or quarries
                </label>
              </div>
              <div class="govuk-checkboxes__item">
                <input class="govuk-checkboxes__input" id="waste-3" name="waste" type="checkbox" value="farm">
                <label class="govuk-label govuk-checkboxes__label" for="waste-3">
                  Farm or agricultural waste
                </label>
              </div>
            </div>

          </fieldset>
        </div>
      HTML
    end
  end
end
