module GovukDesignSystem
  module TagHelper
    def govukTag(text: nil, html: nil, classes: "", attributes: {})
      attributes["class"] = class_names("govuk-tag", classes)
      content_tag("strong", (html || text), attributes)
    end
  end
end
