require "rails_helper"

RSpec.describe GovukDesignSystem::SelectHelper, type: :helper do
  describe "#govukSelect" do
    it "returns the correct HTML for the default example" do
      html = helper.govukSelect({
        id: "sort",
        name: "sort",
        label: {
          text: "Sort by"
        },
        items: [
          {
            value: "published",
            text: "Recently published"
          },
          {
            value: "updated",
            text: "Recently updated",
            selected: true
          },
          {
            value: "views",
            text: "Most views"
          },
          {
            value: "comments",
            text: "Most comments"
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <label class="govuk-label" for="sort">
            Sort by
          </label>
          <select class="govuk-select" id="sort" name="sort">
            <option value="published">Recently published</option>
            <option value="updated" selected="selected">Recently updated</option>
            <option value="views">Most views</option>
            <option value="comments">Most comments</option>
          </select>
        </div>
      HTML
    end

    it "allows attributes to be passed" do
      html = helper.govukSelect({
        id: "sort",
        name: "sort",
        label: {
          text: "Sort by"
        },
        items: [
          {
            value: "published",
            text: "Recently published"
          },
          {
            value: "updated",
            text: "Recently updated",
            selected: true
          }
        ],
        attributes: {
          disabled: true,
          data: { test: "testing" }
        }
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <label class="govuk-label" for="sort">
            Sort by
          </label>
          <select class="govuk-select" id="sort" name="sort" disabled="disabled" data-test="testing">
            <option value="published">Recently published</option>
            <option value="updated" selected="selected">Recently updated</option>
          </select>
        </div>
      HTML
    end
  end
end
