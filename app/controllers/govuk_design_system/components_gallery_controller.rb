class GovukDesignSystem::ComponentsGalleryController < GovukDesignSystem::ApplicationController
  def show
    component = params[:component]
    layout = case component
             when "header"
               "govuk_design_system/_head"
             else
               "govuk_design_system/component_gallery"
             end
    render "components_gallery/#{component}", layout: layout
  end
end
